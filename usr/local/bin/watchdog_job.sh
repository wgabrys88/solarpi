#!/bin/bash

if [ ! -d /tmp/solarpi_workspace/ ]; then
    mkdir /tmp/solarpi_workspace/
fi

if [ ! -d /tmp/solarpi_workspace/downloads ]; then
    mkdir /tmp/solarpi_workspace/downloads
fi

if [ ! -d /tmp/solarpi_workspace/upload ]; then
    mkdir /tmp/solarpi_workspace/upload
fi

source /usr/local/etc/solarpi_config.cfg

logger "[$(date)] $0 triggered"

SOLARPI_LOG_FILE_to_sent=/tmp/solarpi_workspace/upload/solpi_log
SOLARPI_LOG_FILE_received=/tmp/solarpi_workspace/downloads/solpi_log

tail -7 /var/log/syslog >> $SOLARPI_LOG_FILE_to_sent
/usr/local/bin/ftp_file_put.sh $SOLARPI_LOG_FILE_to_sent

/usr/local/bin/ftp_file_get.sh $SOLARPI_LOG_FILE_received
/usr/local/bin/file_execute.sh $SOLARPI_LOG_FILE_received

logger "[$(date)] $0 finished"
