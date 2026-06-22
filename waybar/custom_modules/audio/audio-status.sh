#!/bin/bash

# Check if playerctl is available
if ! command -v playerctl &> /dev/null; then
    echo "󰝛"
    exit 0
fi

# Get player status
status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    echo "󰐊"
elif [ "$status" = "Paused" ]; then
    echo "󰏤"
else
    echo "󰝛"
fi
