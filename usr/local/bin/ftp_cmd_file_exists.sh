#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

curl -I -u $FTP_CREDENTIALS ftp://$FTP_IP$FTP_EXEC_FILE_PATH
