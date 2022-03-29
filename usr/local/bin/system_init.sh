#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

sleep $GPIO_RELAY_SWITCH_DELAY
/usr/local/bin/relay_init.sh 20
sleep $GPIO_RELAY_SWITCH_DELAY
/usr/local/bin/relay_init.sh 21

/usr/local/bin/pwm_init.sh 0
/usr/local/bin/pwm_init.sh 1
/usr/local/bin/pwm_init.sh 2
