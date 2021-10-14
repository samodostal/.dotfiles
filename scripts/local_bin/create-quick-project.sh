#!/bin/bash

date=$(date +%Y-%m-%d)
time=$(date +%T)
folder_name="${date}_${time}"
file_type=`cat ${HOME}/local_bin/quick-project-languages | fzf --reverse`

if test -z "$file_type"
then
  exit 1
fi

destination_folder="${HOME}/Projects/quick_projects/${file_type}"
templates_folder="${HOME}/Projects/quick_projects/TEMPLATES/${file_type}"

mkdir "${destination_folder}/${folder_name}"
cp -a "${templates_folder}/." "${destination_folder}/${folder_name}/"

session_name="${file_type}_${folder_name:11:5}"
tmux new -s "${session_name}" -c "${destination_folder}/${folder_name}" \; send-keys 'nvim' 'C-m' \; new-window \; select-window -t 1 \;
