#!/bin/bash

killall -9 waybar

waybar &

killall -9 rofi
killall -9 wofi

pkill -9 quickshell
#quickshell &
#killall -9 qs
#qs -c /home/D35IRE/.config/quickshell/bar/modules
