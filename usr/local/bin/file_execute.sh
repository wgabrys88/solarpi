#!/bin/bash

logger "[$(date)] $0 triggered"
logger "Parameters: $1"

file="$1"

if [ -e "$file" ]; then
    cat "$file"
    /bin/bash "$file"
    logger "[$(date)] $0 file executed"
else
    logger "[$(date)] $0 FAIL: file not executed"
fi
