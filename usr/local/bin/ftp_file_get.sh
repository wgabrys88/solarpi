#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

file="$SOLARPI_WORKSPACE"/"$1"
curl -n -o "$file"
