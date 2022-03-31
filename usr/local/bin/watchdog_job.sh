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

SOLARPI_LOG_FILE="/tmp/solarpi_workspace/solpi_log"

touch $SOLARPI_LOG_FILE
echo "[$(date)] $0 ping" >> $SOLARPI_LOG_FILE
/usr/local/bin/ftp_file_put.sh $SOLARPI_LOG_FILE

/usr/local/bin/ftp_file_get.sh "solpi_log" /tmp/solarpi_workspace/downloads
/usr/local/bin/file_execute.sh /tmp/solarpi_workspace/downloads/solpi_log

logger "[$(date)] $0 finished"
