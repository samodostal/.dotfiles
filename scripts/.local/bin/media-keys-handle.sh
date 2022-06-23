#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Playerctl operation must be passed (e.g. play)";
  exit;
fi
#If Spotify is open only change that, otherwise all players
if [[ $(ps -A | grep spotify) ]]; then
  playerctl -p spotify $1;
else
  playerctl -a $1;
fi
