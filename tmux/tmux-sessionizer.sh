#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find  ~/.config ~ ~/Documents ~/workspaces ~/workspaces/smol-projects ~/workspaces/homelab  ~/workspaces/writing ~/workspaces/open-source ~/college -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

next_session=1
while tmux has-session -t=$next_session 2>/dev/null; do
    next_session=$((next_session + 1))
done

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
