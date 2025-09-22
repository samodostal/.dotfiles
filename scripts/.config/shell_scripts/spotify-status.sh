#!/bin/bash

readonly MAX_LENGTH=32

status=$(playerctl status 2>/dev/null)
metadata=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)

if [ ${#metadata} -gt $MAX_LENGTH ]; then
	trimmed="${metadata:0:$MAX_LENGTH}"
	trimmed=$(echo -n "$trimmed" | sed 's/[[:space:]]*$//')
	metadata="${trimmed}..."
fi

if [ "$status" = "Playing" ]; then
	icon=""
elif [ "$status" = "Paused" ]; then
	icon=""
else
	icon=""
	metadata="No music playing"
fi

echo "$icon $metadata"
