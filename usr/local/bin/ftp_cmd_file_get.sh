#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

curl -n --quote "-DELE $FTP_EXEC_FILE_PATH" -o $EXEC_FILE_PATH ftp://$FTP_IP$FTP_EXEC_FILE_PATH
