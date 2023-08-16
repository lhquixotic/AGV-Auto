import Jetson.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

GPIO.setup(12, GPIO.OUT)

GPIO.output(12, GPIO.HIGH)

# GPIO.output(12, GPIO.LOW)

# GPIO.cleanup()
