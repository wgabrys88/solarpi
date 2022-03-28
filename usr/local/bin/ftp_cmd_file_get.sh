#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

curl --quote "-DELE $FTP_EXEC_FILE_NAME" -u $FTP_CREDENTIALS -o $EXEC_FILE_PATH ftp://$FTP_IP$FTP_EXEC_FILE_PATH
