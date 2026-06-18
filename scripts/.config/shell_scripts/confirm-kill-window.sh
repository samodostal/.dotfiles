#!/usr/bin/env bash

choice=$(printf "No\nYes" | wofi \
  --dmenu \
  --prompt "Close window?" \
  --no-search \
  --width 300 \
  --height 120)

if [[ "$choice" == "Yes" ]]; then
    hyprctl dispatch killactive
fi
