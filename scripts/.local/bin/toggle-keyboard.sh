#!/bin/bash
(setxkbmap -query | grep -q "dvorak") && setxkbmap us || setxkbmap us -v dvorak -option caps:swapescape
