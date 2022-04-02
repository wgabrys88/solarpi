#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

if [ ! -d "$SOLARPI_WORKSPACE/" ]; then
    mkdir "$SOLARPI_WORKSPACE/"
    touch "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    touch "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"
    echo > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
fi
