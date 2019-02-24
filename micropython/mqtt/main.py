import mqtt 
import network
import webrepl

test = mqtt.Test()
test.current_status()

while True:
	mqtt.mqtt_init()

