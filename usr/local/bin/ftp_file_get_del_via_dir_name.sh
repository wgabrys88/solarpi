#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

url="ftp://$SOLARPI_FTP_IP/files/solarpi_ftp_working_dir/execution_dir/"
echo "url = \"$url\"" > ~/.curlrc

echo > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

cmd=$(curl -n -l)

if [ $cmd == "StopYoutube" ]; then
    echo "sudo systemctl stop solarpi-youtube.service" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE" && curl -n -l -Q "-RMD $cmd"
fi

if [ $cmd == "StartYoutube" ]; then
    echo "sudo systemctl start solarpi-youtube.service" > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE" && curl -n -l -Q "-RMD $cmd"
fi
