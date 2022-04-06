#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

if [ ! -d "$SOLARPI_WORKSPACE/" ]; then
    mkdir "$SOLARPI_WORKSPACE/"
    /usr/local/bin/usb_power_off.sh
    /usr/local/bin/hdmi_power_off.sh
fi
