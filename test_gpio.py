import Jetson.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

GPIO.setup(21, GPIO.IN)

GPIO.setup(19, GPIO.OUT)

GPIO.output(19, GPIO.LOW)

print(GPIO.input(21))

# GPIO.output(19, GPIO.HIGH)

# GPIO.output(12, GPIO.LOW)

# GPIO.cleanup()
