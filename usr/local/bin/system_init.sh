#!/bin/bash
source /usr/local/etc/solarpi_config.cfg
/usr/local/bin/workspace_init.sh

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
