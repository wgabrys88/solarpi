#!/bin/bash
source /usr/local/etc/solarpi_config.cfg
/usr/local/bin/workspace_init.sh

/usr/local/bin/gdrive_get_cmd.sh
/usr/local/bin/file_execute.sh "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
echo > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
