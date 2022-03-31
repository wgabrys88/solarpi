#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

logger "[`date`] $0 triggered"

tail -30 /var/log/syslog > "$SOLARPI_WORKSPACE/logger_syslog"
ftp_file_put.sh "logger_syslog"

ftp_file_get.sh "solarpi_instructions"
workspace_file_execute.sh "solarpi_instructions"

logger "[`date`] $0 execution finished"
