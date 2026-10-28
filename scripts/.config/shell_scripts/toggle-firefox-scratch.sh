#!/bin/sh
if ! hyprctl clients -j | grep -q '"firefox-scratch"'; then
    hyprctl dispatch exec "[workspace special:firefox silent] firefox-scratch.sh"
    sleep 3
fi
hyprctl dispatch togglespecialworkspace firefox
