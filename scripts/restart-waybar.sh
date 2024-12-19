#!/bin/bash

debug=false

# Check if the image path is provided and if the debug flag is set
if [[ "$1" == "-d" || "$1" == "--debug" ]]; then
    debug=true
    shift
fi

# Kill existing Waybar instance if running
killall waybar >/dev/null 2>&1

# Start Waybar with or without debug output
if [ "$debug" == true ]; then
    waybar -c ~/.config/waybar/rice.jsonc -s ~/.config/waybar/rice.css -l debug
else
    waybar -c ~/.config/waybar/rice.jsonc -s ~/.config/waybar/rice.css >/dev/null 2>&1 &
fi
