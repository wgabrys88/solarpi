#!/bin/bash

cat ~/.solarpi_ftp_ip >> usr/local/etc/solarpi_config.cfg

sudo rm -vf /usr/local/etc/*
sudo rm -vf /usr/local/bin/*

sudo cp -v usr/local/etc/* /usr/local/etc/
sudo cp -v usr/local/bin/* /usr/local/bin/
