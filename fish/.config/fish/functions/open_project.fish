#!/usr/bin/env fish

function list_projects
  ls -d ~/Projects/* | xargs -n 1 &
  ls -d ~/Projects/Resco/* | xargs -n 1 &
  ls -d ~/Projects/udemy/* | xargs -n 1 &
  ls -d ~/Projects/udemy/rust/* | xargs -n 1 &
  ls -d ~/Projects/freelance/* | xargs -n 1 &
  ls -d ~/Projects/freelance/aj_toto_je_umenie/* | xargs -n 1 &
  ls -d ~/Projects/Tests/* | xargs -n 1
  ls -d ~/Projects/smart_trials/* | xargs -n 1
end

function open_project
  set -l project_path (list_projects | fzf)
  echo $project_path | cut -c 30- | read project_name

  cd $project_path
  command tmux attach-session -t $project_name || tmux new-session -s $project_name \; send-keys 'nvim' 'C-m' \; rename-window 'vim' \; new-window \; rename-window 'run' \; new-window \; rename-window 'vifm' \; send-keys 'vifm .' 'C-m' \; new-window \; rename-window 'git' \; send-keys 'git status' 'C-m' \; select-window -t 1 \;
end
