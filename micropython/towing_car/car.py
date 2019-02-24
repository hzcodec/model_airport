import time
import machine
from lolin_gpio import Pin

DUTY_CYCLE = 80
PWM_FREQ = 1000

class Status():
	firmware = 'car'
	version = 'PA3'

class TowCar():
	def __init__(self):
		self.blue_led = machine.Pin(2, machine.Pin.OUT)
		self.motor_backword = Pin(1, Pin.OUT)
		self.motor_forward = machine.PWM(machine.Pin(4), freq=PWM_FREQ)  # pin D2
		self.motor_forward.duty(DUTY_CYCLE)
		self.motor_forward.init()
		self.status = Status()

	def run(self):
		self.blue_led.off()
		self.motor_backword.off()
		time.sleep(1.5)

		self.blue_led.on()
		self.motor_backword.on()
		time.sleep(2)

	def current_status(self):
		print(15*'-')
		print('Firmware: {0} '.format(self.status.firmware))
		print('Version: {0} '.format(self.status.version))
		print(15*'-')

