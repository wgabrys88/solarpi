#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

CRONTAB_TEMP_FILE_NAME=temp_crontab
CRONTAB_TEMP_FILE_PATH=$SOLARPI_WORKSPACE/$CRONTAB_TEMP_FILE_NAME

echo "* * * * * /usr/local/bin/watchdog_job.sh" > $CRONTAB_TEMP_FILE_PATH
crontab $CRONTAB_TEMP_FILE_PATH

rm -f $CRONTAB_TEMP_FILE_PATH
