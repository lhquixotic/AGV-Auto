#include <iostream>
#include <chrono>
#include <cmath>
#include "cuda_utils.h"
#include "logging.h"
#include "common.hpp"
#include "utils.h"
#include "calibrator.h"
#include "preprocess.h"
#include <numeric>

#include "yolo_detect/target.h"
#include <ros/ros.h>
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>
#include <cv_bridge/cv_bridge.h> //cv_bridge是在ROS图像消息和OpenCV图像之间进行转换的一个功能包。如提供sensor_msgs
#include <opencv2/highgui/highgui.hpp>

ros::Publisher pub;
yolo_detect::target target;
ros::Time stamp;
double dt_sum = 0;
int cnt = 0;
double fps = 0;

#define USE_FP16 // set USE_INT8 or USE_FP16 or USE_FP32
#define DEVICE 0 // GPU id
#define NMS_THRESH 0.4
#define CONF_THRESH 0.5
#define BATCH_SIZE 1
#define MAX_IMAGE_INPUT_SIZE_THRESH 3000 * 3000 // ensure it exceed the maximum size in the input images !

// stuff we know about the network and the input/output blobs
static const int INPUT_H = Yolo::INPUT_H;
static const int INPUT_W = Yolo::INPUT_W;
static const int CLASS_NUM = Yolo::CLASS_NUM;
static const int OUTPUT_SIZE = Yolo::MAX_OUTPUT_BBOX_COUNT * sizeof(Yolo::Detection) / sizeof(float) + 1; // we assume the yololayer outputs no more than MAX_OUTPUT_BBOX_COUNT boxes that conf >= 0.1
const char *INPUT_BLOB_NAME = "data";
const char *OUTPUT_BLOB_NAME = "prob";
static Logger gLogger;
static float prob[BATCH_SIZE * OUTPUT_SIZE];
cudaStream_t stream;
void doInference(IExecutionContext &context, cudaStream_t &stream, void **buffers, float *output, int batchSize)
{
    // infer on the batch asynchronously, and DMA output back to host
    context.enqueue(batchSize, buffers, stream, nullptr);
    CUDA_CHECK(cudaMemcpyAsync(output, buffers[1], batchSize * OUTPUT_SIZE * sizeof(float), cudaMemcpyDeviceToHost, stream));
    cudaStreamSynchronize(stream);
}

std::vector<std::string> categories = {
    "person",
    "bicycle",
    "car",
    "motorcycle",
    "airplane",
    "bus",
    "train",
    "truck",
    "boat",
    "traffic light",
    "fire hydrant",
    "stop sign",
    "parking meter",
    "bench",
    "bird",
    "cat",
    "dog",
    "horse",
    "sheep",
    "cow",
    "elephant",
    "bear",
    "zebra",
    "giraffe",
    "backpack",
    "umbrella",
    "handbag",
    "tie",
    "suitcase",
    "frisbee",
    "skis",
    "snowboard",
    "sports ball",
    "kite",
    "baseball bat"
    "baseball glove",
    "skateboard",
    "surfboard",
    "tennis racket",
    "bottle"
    "wine glass",
    "cup",
    "fork",
    "knife",
    "spoon",
    "bowl",
    "banana",
    "apple",
    "sandwich",
    "orange",
    "broccoli",
    "carrot",
    "hot dog",
    "pizza",
    "donut",
    "cake",
    "chair",
    "couch",
    "potted plant",
    "bed",
    "dining table",
    "toilet",
    "tv",
    "laptop",
    "mouse",
    "remote",
    "keyboard",
    "cell phone",
    "microwave",
    "oven",
    "toaster",
    "sink",
    "refrigerator",
    "book",
    "clock",
    "vase",
    "scissors",
    "teddy bear",
    "hair drier",
    "toothbrush",
};

void imageCallback(const sensor_msgs::ImageConstPtr &msg1, const sensor_msgs::ImageConstPtr &msg2, IExecutionContext *context)
{
    ros::Duration dt = msg1->header.stamp - stamp;
    if (dt_sum < 1)
    {
        cnt += 1;
        dt_sum += dt.nsec / 1e9;
    }
    else
    {
        fps = 1 / dt_sum * cnt;
        cnt = 0;
        dt_sum = 0;
    }
    // double fps = 1e9 / dt.nsec;
    stamp = msg1->header.stamp;
    const ICudaEngine &engine = (*context).getEngine();
    float *buffers[2];
    // In order to bind the buffers, we need to know the names of the input and output tensors.
    // Note that indices are guaranteed to be less than IEngine::getNbBindings()
    const int inputIndex = engine.getBindingIndex(INPUT_BLOB_NAME);
    const int outputIndex = engine.getBindingIndex(OUTPUT_BLOB_NAME);
    assert(inputIndex == 0);
    assert(outputIndex == 1);
    // Create GPU buffers on device
    CUDA_CHECK(cudaMalloc((void **)&buffers[inputIndex], BATCH_SIZE * 3 * INPUT_H * INPUT_W * sizeof(float)));
    CUDA_CHECK(cudaMalloc((void **)&buffers[outputIndex], BATCH_SIZE * OUTPUT_SIZE * sizeof(float)));

    // Create stream

    uint8_t *img_host = nullptr;
    uint8_t *img_device = nullptr;
    // prepare input data cache in pinned memory
    CUDA_CHECK(cudaMallocHost((void **)&img_host, MAX_IMAGE_INPUT_SIZE_THRESH * 3));
    // prepare input data cache in device memory
    CUDA_CHECK(cudaMalloc((void **)&img_device, MAX_IMAGE_INPUT_SIZE_THRESH * 3));

    float *buffer_idx = (float *)buffers[inputIndex];

    cv::Mat img;
    cv_bridge::CvImageConstPtr cv_ptr1;
    cv_ptr1 = cv_bridge::toCvShare(msg1, "bgr8");
    img = cv_ptr1->image;

    cv::Mat img_d;
    cv_bridge::CvImageConstPtr cv_ptr2;
    cv_ptr2 = cv_bridge::toCvShare(msg2, "16UC1");
    img_d = cv_ptr2->image;
    auto start = std::chrono::system_clock::now();
    if (!img.empty() && !img_d.empty())
    {
        size_t size_image = img.cols * img.rows * 3;
        size_t size_image_dst = INPUT_H * INPUT_W * 3;
        // copy data to pinned memory
        memcpy(img_host, img.data, size_image);
        // copy data to device memory
        CUDA_CHECK(cudaStreamCreate(&stream));
        CUDA_CHECK(cudaMemcpyAsync(img_device, img_host, size_image, cudaMemcpyHostToDevice, stream));
        preprocess_kernel_img(img_device, img.cols, img.rows, buffer_idx, INPUT_W, INPUT_H, stream);
        // Run inference

        doInference(*context, stream, (void **)buffers, prob, BATCH_SIZE);
        auto end = std::chrono::system_clock::now();
        std::cout << "inference time: " << std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << "ms" << std::endl;
        std::vector<std::vector<Yolo::Detection>> batch_res(1);

        auto &res = batch_res[0];
        nms(res, &prob[0 * OUTPUT_SIZE], CONF_THRESH, NMS_THRESH);

        for (size_t j = 0; j < res.size(); j++)
        {
            int class_idx = (int)res[j].class_id;
            cv::Rect r = get_rect(img, res[j].bbox);
            r.x = std::max(r.x, 0);
            r.y = std::max(r.y, 0);
            r.width = std::min(r.width, img.cols - r.x);
            r.height = std::min(r.height, img.rows - r.y);
            cv::Mat roiimg = img_d(r);

            /****计算截断均值作为距离平均值（直接均值误差太大******/
            /*std::vector<unsigned short> pixelValues;
            for (int row = 0; row < roiimg.rows; ++row)
            {
                for (int col = 0; col < roiimg.cols; ++col)
                {
                    unsigned short pixel = roiimg.at<unsigned short>(row, col);
                    pixelValues.push_back(pixel);
                }
            }
            std::sort(pixelValues.begin(), pixelValues.end());
            int truncateSize = static_cast<int>(pixelValues.size() * 0.2);
            pixelValues.erase(pixelValues.begin(), pixelValues.begin() + truncateSize);
            pixelValues.erase(pixelValues.end() - truncateSize, pixelValues.end());
            double distance = std::accumulate(pixelValues.begin(), pixelValues.end(), 0.0) / pixelValues.size();*/
            /****计算截断均值作为距离平均值******/

            /****形态学操作得到轮廓进行平均******/
            cv::Mat normalized_image;
            cv::Mat grayImage;
            cv::normalize(roiimg, normalized_image, 0, 255, cv::NORM_MINMAX);
            normalized_image.convertTo(grayImage, CV_8U);
            cv::Mat binaryImage;
            double otsu_threshold = cv::threshold(grayImage, binaryImage, 0, 255, cv::THRESH_BINARY | cv::THRESH_OTSU);
            cv::threshold(grayImage, binaryImage, otsu_threshold, 255, cv::THRESH_BINARY_INV);
            // 提取图像中的轮廓
            std::vector<std::vector<cv::Point>> contours;
            std::vector<cv::Vec4i> hierarchy;
            cv::findContours(binaryImage, contours, hierarchy, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);
            // 找到最大轮廓
            size_t largestContourIndex = 0;
            double largestContourArea = 0.0;
            for (size_t i = 0; i < contours.size(); i++)
            {
                double area = cv::contourArea(contours[i]);
                if (area > largestContourArea)
                {
                    largestContourArea = area;
                    largestContourIndex = i;
                }
            }
            cv::Mat mask = cv::Mat::zeros(roiimg.size(), CV_16UC1);
            // 绘制最大轮廓到掩码图像上
            cv::drawContours(mask, contours, largestContourIndex, cv::Scalar(65535), cv::FILLED);
            //cv:: imshow("1", mask);
            // 将深度图像与掩码图像进行按位与运算，得到最大轮廓对应的区域
            cv::Mat maskedImage;
            cv::bitwise_and(roiimg, mask, maskedImage);
	    std::vector<unsigned short> pixelValues;
            for (int row = 0; row < maskedImage.rows; ++row)
            {
                for (int col = 0; col < maskedImage.cols; ++col)
                {
                    unsigned short pixel = maskedImage.at<unsigned short>(row, col);
                    pixelValues.push_back(pixel);
                }
            }
            std::sort(pixelValues.begin(), pixelValues.end());
            int truncateSize = static_cast<int>(pixelValues.size() * 0.2);
            pixelValues.erase(pixelValues.begin(), pixelValues.begin() + 0.5*truncateSize);
            pixelValues.erase(pixelValues.end() - 1.5*truncateSize, pixelValues.end());
            double distance = std::accumulate(pixelValues.begin(), pixelValues.end(), 0.0) / pixelValues.size();
            // // 计算区域的平均值
            double distance1 = cv::mean(maskedImage)[0];
	    //cv:: imshow("1", maskedImage);
            /****形态学操作得到轮廓进行平均******/

            // 直接均值误差
            double distance2 = cv::mean(roiimg)[0];

            //ROS_INFO("distance = [%f, %f, %f]", distance, distance1, distance2);

            if (distance < 2000)
            {
                cv::rectangle(img, r, cv::Scalar(0, 0, 256), 2);
            }
            else
            {
                cv::rectangle(img, r, cv::Scalar(0x27, 0xC1, 0x36), 2);
            }

            std::stringstream conf;
            conf << std::fixed << std::setprecision(2) << res[j].conf;
            std::stringstream dt;
            dt << std::fixed << std::setprecision(3) << (distance / 1000);

            cv::putText(img, categories[class_idx] + ":" + conf.str(), cv::Point(r.x, r.y + 20), cv::FONT_HERSHEY_PLAIN, 1.3, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
            cv::putText(img, "distance:" + dt.str() + "m", cv::Point(r.x, r.y + 40), cv::FONT_HERSHEY_PLAIN, 1.3, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
            //  填充消息，并发布
            target.ClassName = categories[(int)res[j].class_id];
            target.conf = res[j].conf;
            target.tl_x = r.tl().x;
            target.tl_y = r.tl().y;
            target.br_x = r.br().x;
            target.br_y = r.br().y;
            target.distance = distance;
            pub.publish(target);
            ROS_INFO("Object detected === [%s]", categories[(int)res[j].class_id].c_str());
            // cv::imwrite("result.jpg", img);
        }
    }
    std::stringstream FPS;
    FPS << std::fixed << std::setprecision(2) << fps;
    cv::putText(img, "FPS:" + FPS.str(), cv::Point(10, 30), cv::FONT_HERSHEY_PLAIN, 1.3, cv::Scalar(0xFF, 0xFF, 0xFF), 2);
    CUDA_CHECK(cudaFree(img_device));
    CUDA_CHECK(cudaFreeHost(img_host));
    CUDA_CHECK(cudaFree(buffers[inputIndex]));
    CUDA_CHECK(cudaFree(buffers[outputIndex]));
    cv::imshow("YOLOv5", img);

    cv::waitKey(1); // 一定要加这个，不然不显示窗口
}
int main(int argc, char **argv)
{
    cudaSetDevice(DEVICE);
    std::string engine_name = "/home/nvidia/AGV-Auto/src/yolo_detect/src/build/yolov5s.engine";

    // deserialize the .engine and run inference
    std::ifstream file(engine_name, std::ios::binary);
    if (!file.good())
    {
        std::cerr << "read " << engine_name << " error!" << std::endl;
        return -1;
    }
    char *trtModelStream = nullptr;
    size_t size = 0;
    file.seekg(0, file.end);
    size = file.tellg();
    file.seekg(0, file.beg);
    trtModelStream = new char[size];
    assert(trtModelStream);
    file.read(trtModelStream, size);
    file.close();

    IRuntime *runtime = createInferRuntime(gLogger);
    assert(runtime != nullptr);
    ICudaEngine *engine = runtime->deserializeCudaEngine(trtModelStream, size);
    assert(engine != nullptr);
    IExecutionContext *context = engine->createExecutionContext();
    assert(context != nullptr);
    delete[] trtModelStream;
    assert(engine->getNbBindings() == 2);

    // 创建node第一步需要用到的函数
    ros::init(argc, argv, "yolov5s"); // 第3个参数为本节点名，

    ros::NodeHandle nd; // 实例化句柄，初始化node

    // Create a ROS subscriber for the input point cloud

    message_filters::Subscriber<sensor_msgs::Image> sub1(nd, "/camera/color/image_raw", 1);
    message_filters::Subscriber<sensor_msgs::Image> sub2(nd, "/camera/depth/image_rect_raw", 1);
    typedef message_filters::sync_policies::ApproximateTime<sensor_msgs::Image, sensor_msgs::Image> MySyncPolicy;
    message_filters::Synchronizer<MySyncPolicy> sync(MySyncPolicy(10), sub1, sub2);
    sync.registerCallback(boost::bind(&imageCallback, _1, _2, context));
    // std::cout << "sub:" << sub << std::endl;

    // Create a ROS publisher for the output
    pub = nd.advertise<yolo_detect::target>("yolov5s_result", 1);

    ros::spin();

    return 0;
}
