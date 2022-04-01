#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

if [ ! -d "$SOLARPI_WORKSPACE/" ]; then
    mkdir "$SOLARPI_WORKSPACE/"
    touch "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
fi
