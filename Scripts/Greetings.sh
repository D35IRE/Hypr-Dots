#!/bin/zsh

sleep 2
kitty --override font_size=20 --title=greeting ~/.Scripts/message.sh &

sleep 3.5

alacritty --title "StartupTerminal"
