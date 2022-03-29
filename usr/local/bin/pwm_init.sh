#!/bin/bash
source /usr/local/etc/pwm_config.cfg

if [ ! -d "$PWM_CHIP0/pwm$1/" ]; then
    echo $1 > $PWM_CHIP0_EXPORT
    while [ ! -w "$PWM_CHIP0/pwm$1/period" ]; do
        sleep $PWM_INIT_SLEEP
        echo "$PWM_CHIP0/pwm$1/period not yet created, waiting $PWM_INIT_SLEEP[s]..."
    done
    echo $PWM_PERIOD_50Hz > "$PWM_CHIP0/pwm$1/period"
    echo "$PWM_CHIP0/pwm$1/ init completed"
else
    echo "ERROR: $PWM_CHIP0/pwm$1/ already exported"
fi
