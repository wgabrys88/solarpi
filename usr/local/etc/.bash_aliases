if [ ! -d /tmp/solarpi_workspace/ ]; then
    mkdir /tmp/solarpi_workspace/
fi

if [ ! -e /tmp/solarpi_workspace/cmd_exec ]; then
    touch /tmp/solarpi_workspace/cmd_exec
fi

if [ ! -e /tmp/solarpi_workspace/exec_to_send ]; then
    touch /tmp/solarpi_workspace/exec_to_send
fi
