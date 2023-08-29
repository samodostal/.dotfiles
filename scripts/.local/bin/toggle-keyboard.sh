#!/bin/bash
(setxkbmap -query | grep -q "dvorak") && setxkbmap us -option || setxkbmap us -v dvorak -option caps:swapescape
