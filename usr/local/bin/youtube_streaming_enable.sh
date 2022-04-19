#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

/usr/bin/ffmpeg -hide_banner -re -f s16le -i /dev/zero -f v4l2 -thread_queue_size 512 -s 1280x720 -i /dev/video0 -codec:v h264_omx -acodec aac -ab 128k -f flv "rtmp://x.rtmp.youtube.com/live2/$YOUTUBE_KEY"
