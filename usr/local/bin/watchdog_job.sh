#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

if [ ! -d /tmp/solarpi_workspace/ ]; then
    mkdir /tmp/solarpi_workspace/
    touch "$SOLARPI_LOG_FILE"
fi

echo "[$(date)] $0 triggered" >> $SOLARPI_LOG_FILE

echo "[$(date)] $0 ping" >> $SOLARPI_LOG_FILE
/usr/local/bin/ftp_file_put.sh $SOLARPI_LOG_FILE

echo "[$(date)] $0 finished" >> $SOLARPI_LOG_FILE
