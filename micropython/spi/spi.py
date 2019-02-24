import machine
import time
from lolin_gpio import Pin

DUTY_CYCLE = 80
PWM_FREQ = 1000

class Status():
	firmware = 'spi'
	version = 'PA1'

class Spi():
	def __init__(self):
		self.status = Status()
		self.blue_led = machine.Pin(2, machine.Pin.OUT)
		self.motor_backword = Pin(1, Pin.OUT)

		self.pwm = machine.PWM(machine.Pin(4), freq=PWM_FREQ)  # pin D2
		self.pwm.duty(DUTY_CYCLE)
		self.pwm.init()

	def current_status(self):
		print(15*'-')
		print('Firmware: {0} '.format(self.status.firmware))
		print('Version: {0} '.format(self.status.version))
		print(15*'-')

	def run(self):
		self.blue_led.off()
		self.motor_backword.on()

