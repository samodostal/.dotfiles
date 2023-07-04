#!/bin/bash

i3status | while :
do
    read line
    LG=$(print-keyboard.sh) 
    SPOTIFY=$(spotify-status.sh)
    echo -e "$SPOTIFY | $LG | $line" || exit 1
done
