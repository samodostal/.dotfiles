#!/bin/bash

(setxkbmap -query | grep -q "dvorak") && setxkbmap us -variant altgr-intl || setxkbmap dvorak -variant altgr-intl
