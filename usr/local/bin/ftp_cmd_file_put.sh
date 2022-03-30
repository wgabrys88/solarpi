#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

echo $1 > $EXEC_FILE_TO_SEND_PATH
curl -n --upload-file $EXEC_FILE_TO_SEND_PATH ftp://$FTP_IP$FTP_EXEC_FILE_PATH
