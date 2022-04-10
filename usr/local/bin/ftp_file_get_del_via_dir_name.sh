#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

url="ftp://$SOLARPI_FTP_IP/files/solarpi_ftp_working_dir/execution_dir/"
echo "url = \"$url\"" > ~/.curlrc

echo > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

cmd=$(curl -n -l)

echo "[$(date)] $0 Received: $cmd, converting..." >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
arg1=$(echo "$cmd" | awk -F " " '{print $1}')
arg2=$(echo "$cmd" | awk -F " " '{print $2}')
arg3=$(echo "$cmd" | awk -F " " '{print $3}')
echo "[$(date)] $0 Arg 0: $cmd, arg 1: $arg1, arg 2: $arg2, arg 3: $arg3" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

# Stop youtube service
if [ "$arg1" == "stop" ] && [ "$arg2" == "youtube" ]; then
    echo "[$(date)] $0 Egecuting: sudo systemctl $arg1 solarpi-youtube.service" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "sudo systemctl $arg1 solarpi-youtube.service" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
# Start youtube service
elif [ "$arg1" == "start" ] && [ "$arg2" == "youtube" ]; then
    echo "[$(date)] $0 Egecuting: sudo systemctl $arg1 solarpi-youtube.service" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "sudo systemctl $arg1 solarpi-youtube.service" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

# Motor: right, speed: slow, direction: forward
elif [ "$arg1" == "right" ] && [ "$arg2" == "forward" ]; then
    echo "/usr/local/bin/motor_start.sh 0 1513000 $arg3" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
# ... direction: backward
elif [ "$arg1" == "right" ] && [ "$arg2" == "backward" ]; then
    echo "/usr/local/bin/motor_start.sh 0 1533000 $arg3" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

# Motor: left, speed: slow, direction: forward
elif [ "$arg1" == "left" ] && [ "$arg2" == "forward" ]; then
    echo "/usr/local/bin/motor_start.sh 1 1533000 $arg3" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
# ... direction: backward
elif [ "$arg1" == "left" ] && [ "$arg2" == "backward" ]; then
    echo "/usr/local/bin/motor_start.sh 1 1513000 $arg3" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

# Run command
else
    echo "[$(date)] $0 Executing: /usr/local/bin/$cmd.sh $arg1 $arg2" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "/usr/local/bin/$cmd.sh $arg1 $arg2" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
fi

curl -n -l -Q "-RMD $cmd"
