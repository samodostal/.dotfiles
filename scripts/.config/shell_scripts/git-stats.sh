#!/usr/bin/env bash
set -euo pipefail

dir="${1:-$PWD}"
cd "$dir" 2>/dev/null || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

branch=$(git branch --show-current 2>/dev/null || true)
if [[ -z "$branch" ]]; then
	branch=$(git rev-parse --short HEAD 2>/dev/null || true)
fi
[[ -z "$branch" ]] && exit 0

if git rev-parse --verify HEAD >/dev/null 2>&1; then
	base=(HEAD)
else
	base=()
fi

numstat=$(git diff --numstat "${base[@]}" -- 2>/dev/null || true)
added=$(printf '%s\n' "$numstat" | awk '{a += $1} END {print a + 0}')
deleted=$(printf '%s\n' "$numstat" | awk '{d += $2} END {print d + 0}')
changed=$(git diff --name-only "${base[@]}" -- 2>/dev/null | wc -l)
untracked=$(git ls-files --others --exclude-standard | wc -l)
changed=$((changed + untracked))

if [[ "$added" -eq 0 && "$deleted" -eq 0 && "$changed" -eq 0 ]]; then
	printf '󰊢 %s' "$branch"
	exit 0
fi

printf '󰊢 %s  󰐕 %d 󰏫 %d 󰍴 %d' "$branch" "$added" "$changed" "$deleted"
