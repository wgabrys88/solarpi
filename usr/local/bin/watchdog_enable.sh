#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

CRONTAB_TEMP_FILE_NAME=temp_crontab
CRONTAB_TEMP_FILE_PATH=$EXEC_CMD_WORKSPACE$CRONTAB_TEMP_FILE_NAME

crontab -l > $CRONTAB_TEMP_FILE_PATH
echo "* * * * * /usr/local/bin/ftp_cmd_file_put.sh echo" >> $CRONTAB_TEMP_FILE_PATH
crontab $CRONTAB_TEMP_FILE_PATH
rm -f $CRONTAB_TEMP_FILE_PATH
