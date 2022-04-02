#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

url="ftp://$SOLARPI_FTP_IP/files/solarpi_ftp_working_dir/$1"
echo "url = \"$url\"" > ~/.curlrc && curl -n -o "$2" -Q "-DELE $1"
