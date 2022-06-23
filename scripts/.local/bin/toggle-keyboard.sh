#!/bin/bash

(setxkbmap -query | grep -q "dvorak") && setxkbmap us || setxkbmap dvorak
