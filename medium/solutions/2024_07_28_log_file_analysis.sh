#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

logfile=$1

# Check if the file exists
if [ ! -f "$logfile" ]; then
    echo "File not found"
    exit 1
fi



