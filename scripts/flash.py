import os
import sys

class bcolors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'

PATH = "../python/esptool/esptool.py"
PATH2 = "../webrepl/webrepl-master/webrepl_cli.py "
PATH3 = "../micropython"

DEVICE = "/dev/ttyUSB0"
BIN = "../bin/esp8266-20180511-v1.9.4.bin"
IP_ADDRESS_1 = "192.168.4.1"

def print_header():
	print bcolors.YELLOW + "**************************************"
	print "***       ESP8266 flash tool       ***" 
	print "**************************************" + bcolors.ENDC

def help_menu():
    print 40*"-"
    print "[1] - Erase memory"
    print "[2] - Flash binary"
    print 3*"-"
    print "    - blink_led for: ", IP_ADDRESS_1
    print "[3] - Flash main.py"
    print "[4] - Flash lolin_gpio.py"
    print "[5] - Flash blink_led.py"
    print 3*"-"
    print "    - car for: ", IP_ADDRESS_1
    print "[6] - Flash main.py"
    print "[7] - Flash car.py"
    print 3*"-"
    print "    - spi for: ", IP_ADDRESS_1
    print "[8] - Flash main.py"
    print "[9] - Flash spi.py"
    print 3*"-"
    print "[q] - Exit"
    print 40*"-"


def erase_memory():
    print bcolors.GREEN + "Erasing memory ...\n" + bcolors.ENDC
    os.system("python3 " + PATH + " --port " + DEVICE + " --baud 9600 erase_flash")

def flash_bin():
	print bcolors.GREEN + "Flashing binary: ", BIN + bcolors.ENDC
	print " "
	os.system("python3 " + PATH + " --port " + DEVICE + " --baud 460800 write_flash --flash_mode=dout --flash_size=detect 0 " + BIN)

def flash_blink_led_main():
	print bcolors.GREEN + "Flashing main.py" + bcolors.ENDC
        os.system("python " + PATH2 + PATH3 + "/blinky/main.py " + IP_ADDRESS_1 + ":/main.py")

def flash_lolin_gpio():
	print bcolors.GREEN + "Flashing lolin_gpio.py" + bcolors.ENDC
	os.system("python " + PATH2 + PATH3 + "/blinky/lolin_gpio.py " + IP_ADDRESS_1 + ":/lolin_gpio.py")

def flash_blink_led():
	print bcolors.GREEN + "Flashing blink_Led.py" + bcolors.ENDC
        os.system("python " + PATH2 + PATH3 + "/blinky/blink_led.py " + IP_ADDRESS_1 + ":/blink_led.py")


def flash_car_main():
	print bcolors.GREEN + "Flashing main.py" + bcolors.ENDC
        os.system("python " + PATH2 + PATH3 + "/towing_car/main.py " + IP_ADDRESS_1 + ":/main.py")

def flash_car():
	print bcolors.GREEN + "Flashing car.py" + bcolors.ENDC
        os.system("python " + PATH2 + PATH3 + "/towing_car/car.py " + IP_ADDRESS_1 + ":/car.py")


def flash_spi_main():
	print bcolors.GREEN + "Flashing main.py" + bcolors.ENDC
        os.system("python " + PATH2 + PATH3 + "/spi/main.py " + IP_ADDRESS_1 + ":/main.py")

def flash_spi():
	print bcolors.GREEN + "Flashing spi.py" + bcolors.ENDC
        os.system("python " + PATH2 + PATH3 + "/spi/spi.py " + IP_ADDRESS_1 + ":/spi.py")


def exit_application():
	print bcolors.YELLOW + "Good Bye!" + bcolors.ENDC
	sys.exit()


def main():
	print_header()
	help_menu()
	
	choices = {'1': erase_memory, \
		   '2': flash_bin, \
		   '3': flash_blink_led_main, \
		   '4': flash_lolin_gpio, \
		   '5': flash_blink_led, \
		   '6': flash_car_main, \
		   '7': flash_car, \
		   '8': flash_spi_main, \
		   '9': flash_spi, \
		   'q': exit_application}
	key = "x"
	
	while (key != "q"):
	    print ""
	    key = raw_input("Please enter a choice: ")
	    result = choices.get(key, 'default')
	    result()
	    help_menu()
	    

if __name__ == "__main__": 
	main()
