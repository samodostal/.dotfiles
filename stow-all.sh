#!/bin/bash

ignoreList=("keyboard")

for dir in */
do
	parsedDir="${dir%?}"
	if [[ ! " ${ignoreList[*]} " =~ " ${parsedDir} " ]]; then
		echo "Stow-ing: ${parsedDir}"
		stow ${parsedDir}
	fi
done
