#!/bin/bash

killall waybar >/dev/null 2>&1
waybar -c ~/.config/waybar/rice.jsonc -s ~/.config/waybar/rice.css >/dev/null 2>&1 &