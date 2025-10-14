#!/bin/zsh
# wofi-wifi-menu.sh
# Simple WiFi menu using Wofi + nmcli

# Get list of available networks
networks=$(nmcli -t -f SSID,SECURITY device wifi list | awk -F: '!seen[$1]++ {print $1}')

# Ask user to pick one
chosen=$(echo "$networks" | wofi --dmenu --prompt "Wi-Fi:")

# If nothing selected, exit
[ -z "$chosen" ] && exit

# Check if already connected
if nmcli -t -f NAME connection show --active | grep -q "^$chosen$"; then
  notify-send "Wi-Fi" "Already connected to $chosen"
  exit
fi

# Ask for password if needed
if nmcli -t -f SSID,SECURITY device wifi list | grep -q "^$chosen:WPA"; then
  pass=$(wofi --dmenu --password --prompt "Password for $chosen")
  nmcli device wifi connect "$chosen" password "$pass" &&
    notify-send "Wi-Fi" "Connected to $chosen" ||
    notify-send "Wi-Fi" "Failed to connect"
else
  nmcli device wifi connect "$chosen" &&
    notify-send "Wi-Fi" "Connected to $chosen" ||
    notify-send "Wi-Fi" "Failed to connect"
fi
