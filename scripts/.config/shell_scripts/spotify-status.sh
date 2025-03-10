#!/bin/sh

status=$(playerctl status 2>/dev/null)
metadata=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)

if [ "$status" = "Playing" ]; then
    icon=""
elif [ "$status" = "Paused" ]; then
    icon=""
else
    icon=""
    metadata="No music playing"
fi

echo "$icon $metadata"
