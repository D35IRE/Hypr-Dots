#!/bin/zsh
# wofi-bluetooth-menu.sh
# Simple Bluetooth menu using Wofi + bluetoothctl

# Ensure bluetooth is powered on
bluetoothctl power on >/dev/null

# Get list of paired + available devices
devices=$(bluetoothctl devices | awk '{$1=$2=""; print substr($0,3)}')

# Add extra options
menu=" Scan for devices\n$devices\n---\nDisconnect\nToggle Power"

# Ask user to pick
chosen=$(echo -e "$menu" | wofi --dmenu --prompt "Bluetooth:")

# Nothing selected
[ -z "$chosen" ] && exit

case "$chosen" in
" Scan for devices")
  bluetoothctl scan on &
  notify-send "Bluetooth" "Scanning for devices..."
  ;;
"Disconnect")
  dev=$(bluetoothctl info | awk -F' ' '/Device/ {print $2}')
  [ -n "$dev" ] && bluetoothctl disconnect "$dev" &&
    notify-send "Bluetooth" "Disconnected from $dev"
  ;;
"Toggle Power")
  state=$(bluetoothctl show | awk '/Powered/ {print $2}')
  if [ "$state" = "yes" ]; then
    bluetoothctl power off
    notify-send "Bluetooth" "Power off"
  else
    bluetoothctl power on
    notify-send "Bluetooth" "Power on"
  fi
  ;;
*)
  # Find MAC address from chosen name
  mac=$(bluetoothctl devices | grep "$chosen" | awk '{print $2}')
  if [ -n "$mac" ]; then
    # Try connecting
    bluetoothctl connect "$mac" &&
      notify-send "Bluetooth" "Connected to $chosen" ||
      notify-send "Bluetooth" "Failed to connect"
  fi
  ;;
esac
