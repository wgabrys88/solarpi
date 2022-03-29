#!/bin/bash

rm -v /home/$USER/.bash_aliases
cp -v usr/local/etc/.bash_aliases /home/$USER/.bash_aliases
source /home/$USER/.bash_aliases

sudo rm -vf /usr/local/etc/*
sudo rm -vf /usr/local/bin/*

sudo cp -v usr/local/etc/* /usr/local/etc/
sudo cp -v usr/local/bin/* /usr/local/bin/
