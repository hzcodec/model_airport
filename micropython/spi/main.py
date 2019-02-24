import spi
import time

version = "PA1"

spi = spi.Spi()
spi.current_status()


while True:
	spi.run()
	time.sleep(0.5)

