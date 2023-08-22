import Jetson.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
# set In pin
GPIO.setup(21, GPIO.IN) # for manual_switch autonomous mode gpio377
GPIO.setup(22, GPIO.IN) # for manual_switch remote mode gpio274

# set Out pin
# GPIO.setup(19, GPIO.OUT) # for manual_switch_output gpio378
# GPIO.output(19, GPIO.HIGH)

# GPIO.setup(24, GPIO.OUT) # for manual_switch_out gpio379
# GPIO.output(24, GPIO.HIGH)

GPIO.setup(12, GPIO.OUT) # for light gpio392
GPIO.output(12, GPIO.HIGH)

GPIO.setup(35, GPIO.OUT) # for beebee gpio395
GPIO.output(35, GPIO.LOW)

# GPIO.cleanup()
