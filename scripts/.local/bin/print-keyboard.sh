#!/bin/bash

(setxkbmap -query | grep -q "dvorak") && echo 'DV' || echo 'US'
