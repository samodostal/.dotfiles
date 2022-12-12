#!/bin/bash

i3status | while :
do
    read line
    LG=$(setxkbmap -query | awk '/layout/{print $2}') 
    SPOTIFY=$(spotify-status.sh)
    echo -e "$SPOTIFY | $LG | $line" || exit 1
done
