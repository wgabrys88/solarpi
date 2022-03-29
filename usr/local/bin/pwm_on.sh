#!/bin/bash
source /usr/local/etc/pwm_config.cfg

if [ ! -d "$PWM_CHIP0/pwm$1/" ]; then
    echo "ERROR: $PWM_CHIP0/pwm$1/ not initialized!"
else
    while [ ! -w "$PWM_CHIP0/pwm$1/duty_cycle" ]; do
        sleep $PWM_INIT_SLEEP
        echo "ERROR: $PWM_CHIP0/pwm$1/duty_cycle not writeable yet, waiting $PWM_INIT_SLEEP[s]..."
    done
    echo $2 > "$PWM_CHIP0/pwm$1/duty_cycle"
fi
