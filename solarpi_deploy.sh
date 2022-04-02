#!/bin/bash

cat ~/.solarpi_ftp_ip >> usr/local/etc/solarpi_config.cfg
cat ~/.youtube_streaming_key >> usr/local/etc/solarpi_config.cfg

rm -rf /tmp/solarpi_workspace/

sudo rm -vf /usr/local/etc/*
sudo rm -vf /usr/local/bin/*

sudo cp -v usr/local/etc/* /usr/local/etc/
sudo cp -v usr/local/bin/* /usr/local/bin/

sudo cp -v etc/systemd/system/solarpi-* /etc/systemd/system/
