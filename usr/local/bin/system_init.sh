#!/bin/bash

if [ ! -d /tmp/solarpi_workspace/ ]; then
    mkdir /tmp/solarpi_workspace/
fi

source /usr/local/etc/solarpi_config.cfg

sleep "$GPIO_RELAY_SWITCH_DELAY"
/usr/local/bin/relay_init.sh 20
sleep "$GPIO_RELAY_SWITCH_DELAY"
/usr/local/bin/relay_on.sh 20

/usr/local/bin/pwm_init.sh 0

sleep "$GPIO_RELAY_SWITCH_DELAY"
/usr/local/bin/relay_init.sh 21
sleep "$GPIO_RELAY_SWITCH_DELAY"
/usr/local/bin/relay_on.sh 21

/usr/local/bin/pwm_init.sh 1

sleep "$GPIO_RELAY_SWITCH_DELAY"
