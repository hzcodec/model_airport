import machine
import time
from lolin_gpio import Pin

var = 500

def blinky():
   	global var

	led = machine.Pin(2, machine.Pin.OUT)
	pin_D1 = Pin(1, Pin.OUT)

	pin_D2_pwm = machine.PWM(machine.Pin(4), freq=1000)  # pin D2
	pin_D2_pwm.duty(var)
	pin_D2_pwm.init()
	
	led.off()
	pin_D1.off()
	time.sleep(1)

	led.on()
	pin_D2_pwm.deinit()
	time.sleep(1)

