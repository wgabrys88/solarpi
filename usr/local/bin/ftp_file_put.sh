#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

url="ftp://$SOLARPI_FTP_IP/files/solarpi_ftp_working_dir/"
echo "url = \"$url\"" > ~/.curlrc && curl -n -T "$1"
