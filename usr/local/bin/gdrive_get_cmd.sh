#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

echo > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

cmd=$(rclone ls remote:)

# echo "[$(date)] $0 Received: $cmd, converting..." >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
arg1=$(echo "$cmd" | awk -F " " '{print $2}' | awk -F "." '{print $1}')
arg2=$(echo "$cmd" | awk -F " " '{print $3}' | awk -F "." '{print $1}')
arg3=$(echo "$cmd" | awk -F " " '{print $4}' | awk -F "." '{print $1}')
# echo "[$(date)] $0 Arg 0: $cmd, arg 1: $arg1, arg 2: $arg2, arg 3: $arg3" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

# Stop youtube service
if [ "$arg1" == "stop" ] && [ "$arg2" == "youtube" ]; then
    echo "sudo systemctl $arg1 solarpi-youtube.service" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rclone delete remote:
# Start youtube service
elif [ "$arg1" == "start" ] && [ "$arg2" == "youtube" ]; then
    echo "sudo systemctl $arg1 solarpi-youtube.service" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rclone delete remote:

# Motor: right, speed: fast, direction: forward
elif [ "$arg1" == "right" ] && [ "$arg2" == "forward" ]; then
    echo "/usr/local/bin/motor_start.sh 0 $MOTOR_FF $arg3" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rclone delete remote:
# ... direction: backward
elif [ "$arg1" == "right" ] && [ "$arg2" == "backward" ]; then
    echo "/usr/local/bin/motor_start.sh 0 $MOTOR_FB $arg3" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rclone delete remote:

# Motor: left, speed: fast, direction: forward
elif [ "$arg1" == "left" ] && [ "$arg2" == "forward" ]; then
    echo "/usr/local/bin/motor_start.sh 1 $MOTOR_FB $arg3" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rclone delete remote:
# ... direction: backward
elif [ "$arg1" == "left" ] && [ "$arg2" == "backward" ]; then
    echo "/usr/local/bin/motor_start.sh 1 $MOTOR_FF $arg3" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rclone delete remote:

# Reboot
elif [ "$cmd" == "reboot" ]; then
    echo "sudo reboot" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rclone delete remote:
# Shutdown Now
elif [ "$cmd" == "shutdown" ]; then
    echo "sudo shutdown now" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rclone delete remote:
fi
