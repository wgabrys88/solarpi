#!/bin/bash

cp -v usr/local/etc/.bash_aliases /home/$USER/.bash_aliases

cp -v usr/local/etc/solarpi_config.cfg /usr/local/etc/
cp -v usr/local/etc/pwm_config.cfg /usr/local/etc/

cp -v usr/local/bin/* /usr/local/bin/

source /home/$USER/.bash_aliases
