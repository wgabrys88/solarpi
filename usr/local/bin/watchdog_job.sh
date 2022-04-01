#!/bin/bash
source /usr/local/etc/solarpi_config.cfg
/usr/local/bin/system_pre_init.sh

echo "[$(date)] $0 triggered" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

if [ -d "$SOLAR_PI_HOME" ]; then
    echo "[$(date)] $0 ping" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    /usr/local/bin/ftp_file_put.sh "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

    /usr/local/bin/ftp_file_get.sh "$SOLARPI_LOG_FILE" "$SOLARPI_WORKSPACE/received_$SOLARPI_LOG_FILE"
else
    echo
fi

echo "[$(date)] $0 finished" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
