#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

if [ -d "$GPIO_DIR_PATH""gpio2$1/" ]; then
    echo "2$1" > /sys/class/gpio/unexport
    echo "$GPIO_DIR_PATH""gpio2$1/ de-init completed"
else
    echo "ERROR: $GPIO_DIR_PATH""gpio2$1/ already un-exported"
fi
