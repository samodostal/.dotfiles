#!/bin/bash
setxkbmap -query | grep -q 'dvorak' && echo "dvorak" || echo "qwerty"
