import Jetson.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
# set In pin
GPIO.setup(21, GPIO.IN) # gpio377

# set Out pin
GPIO.setup(19, GPIO.OUT) # for manual_switch gpio378
GPIO.output(19, GPIO.HIGH)

GPIO.setup(12, GPIO.OUT) # for light gpio392
GPIO.output(12, GPIO.HIGH)

# GPIO.cleanup()
