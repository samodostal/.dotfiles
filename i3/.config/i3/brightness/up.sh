#!/bin/bash

set -e
file="/sys/class/backlight/intel_backlight/brightness"
current=$(cat "$file")
new="$current"

new=$(( current + 2000 ))

echo "$new" | tee "$file"
