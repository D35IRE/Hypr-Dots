#!/bin/zsh

# Hide cursor
tput civis

# clear screen
clear

# Get Terminal size
rows=$(tput lines)
cols=$(tput cols)

image="$HOME/.config/kitty/knight.png"
img_height=10

# The Message
msg="GREETINGS, OPERATOR."
com="System Awaits Thy Command..."

# Calculate Centered Position
total_height=$((img_height + 2))
top_row=$(( (rows - total_height) / 2 ))
img_col=0
msg_len=${#msg}
com_len=${#com}
msg_row=$((top_row + img_height))
com_row=$((msg_row + 1))
msg_col=$(( (cols - msg_len) / 2 ))
com_col=$(( (cols - com_len) / 2 ))

kitty +kitten icat --place ${cols}x${img_height}@${img_col}x${top_row} --align center "$image"

# Move cursor & Print Message
tput cup $msg_row $msg_col
echo -e "\e[1;97m$msg\e[0m"
tput cup $com_row $com_col
echo -e "\e[1;97m$com\e[0m"
tput sgr0

# Restore cursor before exit
sleep 3
tput cnorm
