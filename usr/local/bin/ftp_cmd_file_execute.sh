#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

if [ -e $EXEC_FILE_PATH ]; then
    echo "Executing: $EXEC_FILE_PATH:"
    cat $EXEC_FILE_PATH
    /bin/bash $EXEC_FILE_PATH
    echo "Completed: $EXEC_FILE_PATH:"
    cat $EXEC_FILE_PATH
else
    echo "ERROR: $EXEC_FILE_PATH file not found!"
fi
