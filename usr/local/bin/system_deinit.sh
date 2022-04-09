#!/bin/bash
source /usr/local/etc/solarpi_config.cfg
source /usr/local/etc/pwm_config.cfg

sleep "$PWM_INIT_SLEEP"
/usr/local/bin/pwm_stop.sh 0
sleep "$PWM_INIT_SLEEP"
/usr/local/bin/pwm_deinit.sh 0
sleep "$GPIO_RELAY_SWITCH_DELAY"
/usr/local/bin/relay_off.sh 0
sleep "$GPIO_RELAY_SWITCH_DELAY"
/usr/local/bin/relay_deinit.sh 0

sleep "$PWM_INIT_SLEEP"
/usr/local/bin/pwm_stop.sh 1
sleep "$PWM_INIT_SLEEP"
/usr/local/bin/pwm_deinit.sh 1
sleep "$GPIO_RELAY_SWITCH_DELAY"
/usr/local/bin/relay_off.sh 1
sleep "$GPIO_RELAY_SWITCH_DELAY"
/usr/local/bin/relay_deinit.sh 1

sleep "$GPIO_RELAY_SWITCH_DELAY"
