# This file is executed on every boot (including wake-boot from deepsleep)
#import esp
#esp.osdebug(None)
import gc
import webrepl
webrepl.start()
gc.collect()

def connect():
	import network
	import time
	print('Boot version: PA1')

	sta_if = network.WLAN(network.STA_IF)

	if not sta_if.isconnected():
		print('Connecting ...')
		sta_if.active(True)
		sta_if.connect('Telia-A43CD9','0BAAD43748')

		while not sta_if.isconnected():
			time.sleep_ms(300)

		print('Connected')

	else:
		print('Already connected')

	print('Network:', sta_if.ifconfig())

connect()


