#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

url="ftp://$SOLARPI_FTP_IP/files/solarpi_ftp_working_dir/execution_dir/"
echo "url = \"$url\"" > ~/.curlrc

echo > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

cmd=$(curl -n -l)

echo "[$(date)] $0 Received: $cmd, converting..." >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
arg1=$(echo "$cmd" | awk -F " " '{print $1}')
arg2=$(echo "$cmd" | awk -F " " '{print $2}')
echo "[$(date)] $0 Argument 0: $cmd, argument 1: $arg1, argument2: $arg2" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

if [ "$arg1" == "stop" ] && [ "$arg2" == "youtube" ]; then
    echo "[$(date)] $0 Egecuting: sudo systemctl $arg1 solarpi-youtube.service" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "sudo systemctl $arg1 solarpi-youtube.service" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE" && curl -n -l -Q "-RMD $cmd"
elif [ "$arg1" == "start" ] && [ "$arg2" == "youtube" ]; then
    echo "[$(date)] $0 Egecuting: sudo systemctl $arg1 solarpi-youtube.service" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "sudo systemctl $arg1 solarpi-youtube.service" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE" && curl -n -l -Q "-RMD $cmd"
else
    echo "[$(date)] $0 Executing: /usr/local/bin/$cmd.sh $arg1 $arg2" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "/usr/local/bin/$cmd.sh $arg1 $arg2" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE" && curl -n -l -Q "-RMD $cmd"
fi

curl -n -l -Q "-RMD $cmd"
