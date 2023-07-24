
(cl:in-package :asdf)

(defsystem "common_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :nav_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ChassisControl" :depends-on ("_package_ChassisControl"))
    (:file "_package_ChassisControl" :depends-on ("_package"))
    (:file "ChassisState" :depends-on ("_package_ChassisState"))
    (:file "_package_ChassisState" :depends-on ("_package"))
    (:file "ControlCommand" :depends-on ("_package_ControlCommand"))
    (:file "_package_ControlCommand" :depends-on ("_package"))
    (:file "ControlCommandStamped" :depends-on ("_package_ControlCommandStamped"))
    (:file "_package_ControlCommandStamped" :depends-on ("_package"))
    (:file "ControlState" :depends-on ("_package_ControlState"))
    (:file "_package_ControlState" :depends-on ("_package"))
    (:file "GpsInfo" :depends-on ("_package_GpsInfo"))
    (:file "_package_GpsInfo" :depends-on ("_package"))
    (:file "MagneticSignal" :depends-on ("_package_MagneticSignal"))
    (:file "_package_MagneticSignal" :depends-on ("_package"))
    (:file "RemoteControl" :depends-on ("_package_RemoteControl"))
    (:file "_package_RemoteControl" :depends-on ("_package"))
    (:file "SerialMsg" :depends-on ("_package_SerialMsg"))
    (:file "_package_SerialMsg" :depends-on ("_package"))
    (:file "Trigger" :depends-on ("_package_Trigger"))
    (:file "_package_Trigger" :depends-on ("_package"))
    (:file "VirtualVehicleState" :depends-on ("_package_VirtualVehicleState"))
    (:file "_package_VirtualVehicleState" :depends-on ("_package"))
  ))