#!/bin/bash

file="$1"

if [ -e "$file" ]; then
    echo "Executing: $file"
    cat "$file"
    /bin/bash "$file"
    echo "Done."
else
    echo "ERROR: $file not found!"
fi
