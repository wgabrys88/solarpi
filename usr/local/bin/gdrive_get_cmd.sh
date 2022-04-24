#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

MOTOR_0_FILE_PATH="$SOLARPI_WORKSPACE/$MOTOR_0_SERVICE_FILE"
MOTOR_1_FILE_PATH="$SOLARPI_WORKSPACE/$MOTOR_1_SERVICE_FILE"

CMD_FILE_PATH="$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
echo > "$CMD_FILE_PATH"

cmd=$(rclone ls remote:)

# echo "[$(date)] $0 Received: $cmd, converting..." >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
arg1=$(echo "$cmd" | awk -F " " '{print $2}' | awk -F "." '{print $1}')
arg2=$(echo "$cmd" | awk -F " " '{print $3}' | awk -F "." '{print $1}')
arg3=$(echo "$cmd" | awk -F " " '{print $4}' | awk -F "." '{print $1}')
# echo "[$(date)] $0 Arg 0: $cmd, arg 1: $arg1, arg 2: $arg2, arg 3: $arg3" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

# Stop youtube service
if [ "$arg1" == "stop" ] && [ "$arg2" == "youtube" ]; then
    echo "sudo systemctl $arg1 solarpi-youtube.service" > "$CMD_FILE_PATH"
    rclone delete remote:
# Start youtube service
elif [ "$arg1" == "start" ] && [ "$arg2" == "youtube" ]; then
    echo "sudo systemctl $arg1 solarpi-youtube.service" > "$CMD_FILE_PATH"
    rclone delete remote:

# Motor: right, speed: fast, direction: forward
elif [ "$arg1" == "right" ] && [ "$arg2" == "forward" ]; then
    echo "0 $MOTOR_FF $arg3" > "$MOTOR_0_FILE_PATH"
    echo "sudo systemctl start motor-0.service" > "$CMD_FILE_PATH"
    rclone delete remote:
# ... direction: backward
elif [ "$arg1" == "right" ] && [ "$arg2" == "backward" ]; then
    echo "0 $MOTOR_FB $arg3" > "$MOTOR_0_FILE_PATH"
    echo "sudo systemctl start motor-0.service" > "$CMD_FILE_PATH"
    rclone delete remote:

# Motor: left, speed: fast, direction: forward
elif [ "$arg1" == "left" ] && [ "$arg2" == "forward" ]; then
    echo "1 $MOTOR_FB $arg3" > "$MOTOR_1_FILE_PATH"
    echo "sudo systemctl start motor-1.service" > "$CMD_FILE_PATH"
    rclone delete remote:
# ... direction: backward
elif [ "$arg1" == "left" ] && [ "$arg2" == "backward" ]; then
    echo "1 $MOTOR_FF $arg3" > "$MOTOR_1_FILE_PATH"
    echo "sudo systemctl start motor-1.service" > "$CMD_FILE_PATH"
    rclone delete remote:

# Motor: all, speed: fast, direction: forward
elif [ "$arg1" == "all" ] && [ "$arg2" == "forward" ]; then
    echo "0 $MOTOR_FF $arg3" > "$MOTOR_0_FILE_PATH"
    echo "1 $MOTOR_FB $arg3" > "$MOTOR_1_FILE_PATH"
    echo "sudo systemctl start motor-0.service" > "$CMD_FILE_PATH"
    echo "sudo systemctl start motor-1.service" >> "$CMD_FILE_PATH"
    rclone delete remote:
# ... direction: backward
elif [ "$arg1" == "all" ] && [ "$arg2" == "backward" ]; then
    echo "0 $MOTOR_FB $arg3" > "$MOTOR_0_FILE_PATH"
    echo "1 $MOTOR_FF $arg3" > "$MOTOR_1_FILE_PATH"
    echo "sudo systemctl start motor-0.service" > "$CMD_FILE_PATH"
    echo "sudo systemctl start motor-1.service" >> "$CMD_FILE_PATH"
    rclone delete remote:

# Reboot
elif [ "$arg1" == "reboot" ]; then
    rclone delete remote:
    echo "sudo reboot" > "$CMD_FILE_PATH"
# Shutdown Now
elif [ "$arg1" == "shutdown" ]; then
    rclone delete remote:
    echo "sudo shutdown now" > "$CMD_FILE_PATH"
fi
