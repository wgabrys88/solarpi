#!/bin/bash
source /usr/local/etc/pwm_config.cfg

/usr/local/bin/pwm_on.sh $1 $PWM_0

sleep $PWM_INIT_SLEEP

if [ "$1" == "0" ]; then
    /usr/local/bin/relay_off.sh 21
elif [ "$1" == "1" ]; then
    /usr/local/bin/relay_off.sh 20
fi
