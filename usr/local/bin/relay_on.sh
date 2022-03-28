#!/bin/bash

echo out > /sys/class/gpio/gpio$1/direction
