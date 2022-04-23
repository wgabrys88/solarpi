#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

MOTOR_FILE_PATH="$SOLARPI_WORKSPACE/$MOTOR_0_SERVICE_FILE"

if [ -s "$MOTOR_FILE_PATH" ]; then
    INPUT_ARGS=$(cat $MOTOR_FILE_PATH)
    echo -n > "$MOTOR_FILE_PATH"

    MOTOR_NUMBER=$(echo $INPUT_ARGS | awk -F " " '{print $1}')
    DUTY_CYCLE=$(echo $INPUT_ARGS | awk -F " " '{print $2}')
    SLEEP_TIME=$(echo $INPUT_ARGS | awk -F " " '{print $3}')

    /usr/local/bin/motor_start.sh "$MOTOR_NUMBER" "$DUTY_CYCLE" "$SLEEP_TIME"
fi
