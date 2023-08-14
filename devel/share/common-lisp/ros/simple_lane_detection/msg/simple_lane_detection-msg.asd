
(cl:in-package :asdf)

(defsystem "simple_lane_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "object" :depends-on ("_package_object"))
    (:file "_package_object" :depends-on ("_package"))
  ))