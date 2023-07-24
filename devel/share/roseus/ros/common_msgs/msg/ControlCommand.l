;; Auto-generated. Do not edit!


(when (boundp 'common_msgs::ControlCommand)
  (if (not (find-package "COMMON_MSGS"))
    (make-package "COMMON_MSGS"))
  (shadow 'ControlCommand (find-package "COMMON_MSGS")))
(unless (find-package "COMMON_MSGS::CONTROLCOMMAND")
  (make-package "COMMON_MSGS::CONTROLCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude ControlCommand.msg.html


(defclass common_msgs::ControlCommand
  :super ros::object
  :slots (_control_mode _linear_velocity _linear_acceleration _steering_angle ))

(defmethod common_msgs::ControlCommand
  (:init
   (&key
    ((:control_mode __control_mode) 0)
    ((:linear_velocity __linear_velocity) 0.0)
    ((:linear_acceleration __linear_acceleration) 0.0)
    ((:steering_angle __steering_angle) 0.0)
    )
   (send-super :init)
   (setq _control_mode (round __control_mode))
   (setq _linear_velocity (float __linear_velocity))
   (setq _linear_acceleration (float __linear_acceleration))
   (setq _steering_angle (float __steering_angle))
   self)
  (:control_mode
   (&optional __control_mode)
   (if __control_mode (setq _control_mode __control_mode)) _control_mode)
  (:linear_velocity
   (&optional __linear_velocity)
   (if __linear_velocity (setq _linear_velocity __linear_velocity)) _linear_velocity)
  (:linear_acceleration
   (&optional __linear_acceleration)
   (if __linear_acceleration (setq _linear_acceleration __linear_acceleration)) _linear_acceleration)
  (:steering_angle
   (&optional __steering_angle)
   (if __steering_angle (setq _steering_angle __steering_angle)) _steering_angle)
  (:serialization-length
   ()
   (+
    ;; int8 _control_mode
    1
    ;; float64 _linear_velocity
    8
    ;; float64 _linear_acceleration
    8
    ;; float64 _steering_angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _control_mode
       (write-byte _control_mode s)
     ;; float64 _linear_velocity
       (sys::poke _linear_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _linear_acceleration
       (sys::poke _linear_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steering_angle
       (sys::poke _steering_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _control_mode
     (setq _control_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _control_mode 127) (setq _control_mode (- _control_mode 256)))
   ;; float64 _linear_velocity
     (setq _linear_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _linear_acceleration
     (setq _linear_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steering_angle
     (setq _steering_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get common_msgs::ControlCommand :md5sum-) "7948587a63d4431bb0f466a6afd13b2c")
(setf (get common_msgs::ControlCommand :datatype-) "common_msgs/ControlCommand")
(setf (get common_msgs::ControlCommand :definition-)
      "int8 control_mode   # 1 for manual control
float64 linear_velocity
float64 linear_acceleration #m/s^2
float64 steering_angle

")



(provide :common_msgs/ControlCommand "7948587a63d4431bb0f466a6afd13b2c")


