#!/bin/bash

# https://github.com/i3/i3/issues/2531
sleep 1; for win in $(wmctrl -l | awk -F' ' '{print $1}'); do wmctrl -i -r $win -b remove,demands_attention; done
