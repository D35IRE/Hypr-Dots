#!/bin/bash

CURRENT_PROFILE=$(powerprofilesctl get)

case "$CURRENT_PROFILE" in
"performance")
  echo '{"text":"","class":"performance"}'
  ;;
"balanced")
  echo '{"text":"☯","class":"balanced"}'
  ;;
"power-saver")
  echo '{"text":"","class":"power-saver"}'
  ;;
*)
  echo '{"text":"Unknown","class":"unknown"}'
  ;;
esac

if [ "$1" == "toggle" ]; then
  case "$CURRENT_PROFILE" in
  "performance")
    powerprofilesctl set balanced
    ;;
  "balanced")
    powerprofilesctl set power-saver
    ;;
  "power-saver")
    powerprofilesctl set performance
    ;;
  esac
fi
