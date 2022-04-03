#!/bin/bash
source /usr/local/etc/solarpi_config.cfg

/usr/bin/ffmpeg -re -f s16le -i /dev/zero -f v4l2 -thread_queue_size 512 -s 1280x720 -i /dev/video0 -codec:v h264 -preset veryfast -acodec aac -ab 128k -g 50 -f flv "rtmp://x.rtmp.youtube.com/live2/$YOUTUBE_KEY"
