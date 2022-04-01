#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

if [ -e "$1" ]; then
    echo "[$(date)] $0 $1 solarpi: job started" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    /bin/bash "$1"
    echo "[$(date)] $0 $1 solarpi: job completed" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
else
    echo "[$(date)] $0 $1 solarpi: failed, wrong argument" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
fi
