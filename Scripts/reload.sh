#!/bin/bash

killall -9 waybar
waybar &

killall -9 rofi
killall -9 wofi

# Uncomment following lines to reload quickshell
# killall -9 quickshell
# quickshell &
