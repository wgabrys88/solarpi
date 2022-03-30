#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

curl -n -I ftp://$FTP_IP$FTP_EXEC_FILE_PATH
