import Jetson.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

GPIO.setup(24, GPIO.OUT) 
GPIO.output(24, GPIO.LOW)

# GPIO.setup(19, GPIO.OUT)

# GPIO.output(19, GPIO.LOW)

# print(GPIO.input(21))

# GPIO.output(19, GPIO.HIGH)

# GPIO.output(12, GPIO.LOW)

# GPIO.cleanup()
