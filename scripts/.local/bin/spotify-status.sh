#!/bin/bash
title=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|grep -E -A 1 "title"|cut -b 44-|cut -d '"' -f 1|grep -E -v ^$`
artist=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|grep -E -A 2 "artist"|cut -b 20-|cut -d '"' -f 2|grep -E -v ^$|grep -E -v array|grep -E -v artist`
echo $title '-' $artist
# export green="\033[1;32m"
# echo -e "${green}$artist , $title"
