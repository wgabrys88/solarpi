#!/bin/bash
source /usr/local/etc/pwm_config.cfg

if [ -d "$PWM_CHIP0/pwm$1/" ]; then
    echo $1 > $PWM_CHIP0_UNEXPORT
    echo "$PWM_CHIP0/pwm$1/ de-init completed"
else
    echo "ERROR: $PWM_CHIP0/pwm$1/ already un-exported"
fi
