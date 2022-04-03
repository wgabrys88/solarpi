#!/bin/bash
source /usr/local/etc/solarpi_config.cfg
/usr/local/bin/workspace_init.sh

if [ -d "$SOLAR_PI_HOME" ]; then
    echo "[$(date)] $0 solarpi: triggered" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    # /usr/local/bin/ftp_file_get.sh "$CLIENT_LOG_FILE" "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE" && \
    # echo "[$(date)] $0 solarpi: received file: $SOLARPI_WORKSPACE/$CLIENT_LOG_FILE" >> \
    # "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

    /usr/local/bin/ftp_file_get_del_via_dir_name.sh
    /usr/local/bin/file_execute.sh "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    echo > "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"

    /usr/bin/systemctl status solarpi-youtube.service | /usr/bin/head -n3 >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"

    # yes | ffmpeg -f v4l2 -video_size 1280x720 -i /dev/video0 -frames 1 "$SOLARPI_WORKSPACE/$CAMERA_CAPTURE_FILE"
    # /usr/local/bin/ftp_file_put.sh "$SOLARPI_WORKSPACE/$CAMERA_CAPTURE_FILE"

    /usr/local/bin/ftp_file_put.sh "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
    echo "[$(date)] $0 solarpi: finished" >> "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE"
else
    echo "[$(date)] $0 client: triggered" >> "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"
    /usr/local/bin/ftp_file_get.sh "$SOLARPI_LOG_FILE" "$SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE" && \
    echo "[$(date)] $0 client: received file: $SOLARPI_WORKSPACE/$SOLARPI_LOG_FILE" >> \
    "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"

    if [ -e "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE" ]; then
        /usr/local/bin/ftp_file_put.sh "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
        rm -f "$SOLARPI_WORKSPACE/$CLIENT_CMD_FILE"
    fi

    /usr/local/bin/ftp_file_put.sh "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"
    echo "[$(date)] $0 client: finished" >> "$SOLARPI_WORKSPACE/$CLIENT_LOG_FILE"
fi
