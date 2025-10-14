#!/bin/bash

# enable blur for rofi
hyprctl keyword windowrulev2 "blur,class:^(rofi)$"

# run rofi with drun mode
rofi -show drun -theme ~/.config/rofi/config.rasi &

ROFI_PID=$!

# wait until rofi starts
sleep 0.2

# listen for keypress in rofi (stdin closes when user types/chooses)
xinput test-xi2 --root | while read line; do
    if [[ $line == *"RawKeyPress"* ]]; then
        # disable blur on first keypress
        hyprctl keyword windowrulev2 "noblur,class:^(rofi)$"
        break
    fi
done

wait $ROFI_PID
# clean up (restore blur rule if needed later)
hyprctl reload
