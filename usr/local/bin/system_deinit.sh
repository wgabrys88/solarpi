#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

sleep $GPIO_RELAY_SWITCH_DELAY
/usr/local/bin/relay_off.sh 20
sleep $GPIO_RELAY_SWITCH_DELAY
/usr/local/bin/relay_off.sh 21
sleep $GPIO_RELAY_SWITCH_DELAY
/usr/local/bin/relay_deinit.sh 20
sleep $GPIO_RELAY_SWITCH_DELAY
/usr/local/bin/relay_deinit.sh 21

sleep $GPIO_RELAY_SWITCH_DELAY
