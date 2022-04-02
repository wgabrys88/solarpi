#!/bin/bash
source /usr/local/etc/solarpi_config.cfg
/usr/local/bin/workspace_init.sh

if [ -d "$SOLAR_PI_HOME" ]; then
    echo "[$(date)] $0 solarpi: triggered" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "[$(date)] $0 solarpi: sending PING" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    /usr/local/bin/ftp_file_put.sh "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

    /usr/local/bin/ftp_file_get.sh "$CLIENT_LOG_FILE" "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"
    echo "[$(date)] $0 solarpi: received file:$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE" >> \
    "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

    rm -f "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    /usr/local/bin/ftp_file_get.sh "$CLIENT_CMD_FILE" "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    /usr/local/bin/file_execute.sh "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

    echo "[$(date)] $0 solarpi: finished" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
else
    echo "[$(date)] $0 client: triggered" >> "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"
    echo "[$(date)] $0 client: sending PING" >> "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"
    /usr/local/bin/ftp_file_put.sh "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"

    /usr/local/bin/ftp_file_get.sh "$SOLARPI_LOG_FILE" "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "[$(date)] $0 client: received file:$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE" >> \
    "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"

    /usr/local/bin/ftp_file_put.sh "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    rm -f "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

    echo "[$(date)] $0 client: finished" >> "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"
fi



