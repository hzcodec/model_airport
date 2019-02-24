import machine
import time
from lolin_gpio import Pin
from umqtt.simple import MQTTClient

DUTY_CYLCLE = 100

class Status():
	firmware = 'mqtt'
	version = 'PA3'

class Test():
	def __init__(self):
		self.status = Status()
		self.led = machine.Pin(2, machine.Pin.OUT)

		server = "192.168.1.178"
		port = 18830
		self.c = MQTTClient("umqtt_client", server, port)
		self.c.set_callback(self.sub_cb)
		#self.c.connect()
		#self.c.subscribe(b"topic_1")

	def current_status(self):
		print(15*'-')
		print('Firmware: {0} '.format(self.status.firmware))
		print('Version: {0} '.format(self.status.version))
		print(15*'-')
		self.led.on() # turn off blue led

	def plot(self):
		self.led.off() # turn on blue led

	def sub_cb(self, topic, msg):
		print(topic)




def mqtt_init():
   	global DUTY_CYLCLE

	pin_D1 = Pin(1, Pin.OUT)

	pin_D2_pwm = machine.PWM(machine.Pin(4), freq=1000)  # pin D2
	pin_D2_pwm.duty(DUTY_CYLCLE)
	pin_D2_pwm.init()
	
	pin_D1.off()
	time.sleep(1)

	pin_D2_pwm.deinit()
	pin_D1.on()
	time.sleep(1)

