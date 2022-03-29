#!/bin/bash
source /usr/local/etc/pwm_config.cfg

/usr/local/bin/pwm_on.sh $1 $PWM_0

sleep $PWM_INIT_SLEEP

/usr/local/bin/relay_off.sh $(("$1" + 20))
