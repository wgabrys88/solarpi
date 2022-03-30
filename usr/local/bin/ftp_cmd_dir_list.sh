#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

curl -n ftp://$FTP_IP$FTP_CMD_FILE_DIR_PATH
