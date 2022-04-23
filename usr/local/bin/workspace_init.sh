#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

if [ ! -d "$SOLARPI_WORKSPACE/" ]; then
    mkdir "$SOLARPI_WORKSPACE/"
    echo -n > "$SOLARPI_WORKSPACE/$MOTOR_0_SERVICE_FILE"
    echo -n > "$SOLARPI_WORKSPACE/$MOTOR_1_SERVICE_FILE"
    # /usr/local/bin/usb_power_off.sh
    # /usr/local/bin/hdmi_power_off.sh
fi
