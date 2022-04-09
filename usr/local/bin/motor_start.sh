#!/bin/bash
source /usr/local/etc/pwm_config.cfg

# Initialize PWM (if needed)
/usr/local/bin/pwm_init.sh "$1"

# Relay init (if needed)
/usr/local/bin/relay_init.sh $(20 + $1)

# Relay on
/usr/local/bin/relay_on.sh $(20 + $1)

# avoid rush current
sleep $PWM_INIT_SLEEP

# Set motor speed
while [ ! -w "$PWM_CHIP0/pwm$1/duty_cycle" ]; do
    sleep $PWM_INIT_SLEEP
    echo "ERROR: $PWM_CHIP0/pwm$1/duty_cycle not writeable yet, waiting $PWM_INIT_SLEEP[s]..."
done
echo $2 > "$PWM_CHIP0/pwm$1/duty_cycle"

# Run motor requested amount of time
sleep "$3"

# Stop motor
echo "$PWM_0" > "$PWM_CHIP0/pwm$1/duty_cycle"

# Hold for a moment
sleep $PWM_INIT_SLEEP

# Relay off
/usr/local/bin/relay_off.sh $(20 + $1)
