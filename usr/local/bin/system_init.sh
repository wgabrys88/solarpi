#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

sleep $GPIO_RELAY_SWITCH_DELAY
/usr/local/bin/relay_init.sh 20
sleep $GPIO_RELAY_SWITCH_DELAY
/usr/local/bin/relay_init.sh 21
