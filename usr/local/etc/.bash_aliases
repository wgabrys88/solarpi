if [ ! -d $EXEC_CMD_WORKSPACE ]; then
    mkdir $EXEC_CMD_WORKSPACE
fi

if [ ! -e $EXEC_FILE_PATH ]; then
    touch $EXEC_FILE_PATH
fi

if [ ! -e $EXEC_FILE_TO_SEND_PATH ]; then
    touch $EXEC_FILE_TO_SEND_PATH
fi
