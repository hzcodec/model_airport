#!/bin/bash

# define colors
RED='\033[0;31m'
GRN='\033[0;32m'
YEL='\033[0;33m'
BLU='\033[0;34m'
NC='\033[0m' # No Color

set -e

help_menu()
{
    echo " "
    echo "Erase memory: -res"
    echo "Flash binary: -bin"
    echo "-----------------------------"
    echo "List directory: -t"
    echo "-----------------------------"
    echo "Flash blinky firmware:"
    echo "Flash blinky: -b"
    echo "Flash lolin_gpio: -l"
    echo "Flash main: -mb"
    echo "-----------------------------"
    echo "Flash towing_car firmware:"
    echo "Flash car: -c"
    echo "Flash main: -mt"
    echo "-----------------------------"
    echo "Flash mqtt firmware:"
    echo "Flash mqtt: -q"
    echo "Flash mqtt ---.1.200: -q2"
    echo "Flash lolin_gpio: -l"
    echo "Flash main: -mq"
    echo "Flash main2: -mq2"
    echo "Flash boot: -boot"
    echo "Flash boot2 ---.1.200: -boot2"
    echo "-----------------------------"
    echo "Flash spi firmware:"
    echo "Flash spi ---1.200: -s"
    echo "Flash main ---1.200: -ms"
    echo "-----------------------------"
}

echo -e "${YEL}**************************************"
echo "***       ESP8266 flash tool       ***"
echo -e "**************************************${NC}"

# check if unit is connected to USB
if ! ls -d /dev/ttyUSB* &> /dev/null; then
    echo -e "${RED}*** No ESP8266 module is connected ***${NC}"
    exit 1
fi


if [ "$1" == "-h" ]; then
    help_menu

elif [ "$1" == "-res" ]; then
    echo "Erasing memory - ESP8266"
    python3 ../python/esptool/esptool.py --port /dev/ttyUSB0 --baud 9600 erase_flash

elif [ "$1" == "-bin" ]; then
    echo "Flashing bin"
    python3 ../python/esptool/esptool.py --port /dev/ttyUSB0 --baud 460800 write_flash --flash_mode=dout --flash_size=detect 0 ../bin/esp8266-20180511-v1.9.4.bin

# list directory with tree command
elif [ "$1" == "-t" ]; then
    tree ../micropython

elif [ "$1" == "-b" ]; then
    echo "Flashing blink_led @ 192.168.4.1"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/blinky/blink_led.py 192.168.4.1:/blink_led.py

elif [ "$1" == "-l" ]; then
    echo "Flashing lolin_gpio @ 192.168.4.1"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/blinky/lolin_gpio.py 192.168.4.1:/lolin_gpio.py

elif [ "$1" == "-mb" ]; then
    echo "Flashing main for blink_led @ 192.168.4.1"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/blinky/main.py 192.168.4.1:/main.py

elif [ "$1" == "-c" ]; then
    echo "Flashing car @ 192.168.4.1"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/towing_car/car.py 192.168.4.1:/car.py

elif [ "$1" == "-mt" ]; then
    echo "Flashing main for towing car @ 192.168.4.1"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/towing_car/main.py 192.168.4.1:/main.py

elif [ "$1" == "-q" ]; then
    echo "Flashing mqtt @ 192.168.4.1"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/mqtt/mqtt.py 192.168.4.1:/mqtt.py

elif [ "$1" == "-q2" ]; then
    echo "Flashing mqtt @ 192.168.1.200"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/mqtt/mqtt.py 192.168.1.200:/mqtt.py

elif [ "$1" == "-mq" ]; then
    echo "Flashing main for mqtt @ 192.168.4.1"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/mqtt/main.py 192.168.4.1:/main.py

elif [ "$1" == "-mq2" ]; then
    echo "Flashing main for mqtt @ 192.168.1.200"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/mqtt/main.py 192.168.1.200:/main.py

elif [ "$1" == "-boot" ]; then
    echo "Flashing boot for mqtt @ 192.168.4.1"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/mqtt/boot.py 192.168.4.1:/boot.py

elif [ "$1" == "-boot2" ]; then
    echo "Flashing boot for mqtt @ 192.168.1.200"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/mqtt/boot.py 192.168.1.200:/boot.py

elif [ "$1" == "-s" ]; then
    echo "Flashing spi @ 192.168.1.200"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/spi/spi.py 192.168.1.200:/spi.py

elif [ "$1" == "-sm" ]; then
    echo "Flashing main for spi @ 192.168.1.200"
    python ../webrepl/webrepl-master/webrepl_cli.py ../micropython/spi/main.py 192.168.1.200:/main.py

else 
    help_menu
fi

