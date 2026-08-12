#!/bin/sh
printf '\n'
printf '\033[36m  ███████╗ ██████╗ ██╗      ██████╗ \033[0m\n'
printf '\033[36m  ██╔════╝██╔═══██╗██║     ██╔═══██╗\033[0m\n'
printf '\033[36m  ███████╗██║   ██║██║     ██║   ██║\033[0m\n'
printf '\033[36m  ╚════██║██║   ██║██║     ██║   ██║\033[0m\n'
printf '\033[36m  ███████║╚██████╔╝███████╗╚██████╔╝\033[0m\n'
printf '\033[36m  ╚══════╝ ╚═════╝ ╚══════╝ ╚═════╝ \033[0m\n'
printf '\n'
printf '\033[1mSolo is your agentic development environment.\033[0m\n'
printf 'It runs your dev stack, your agents, and blank terminals — all in one place.\n'
printf '\n'
printf 'Each process on the left runs in its own terminal.\n'
printf 'Click one to see its output here.\n'
printf '\n'
printf '\033[33m●\033[0m  Click the other processes in the sidebar to explore\n'
printf '\033[34m●\033[0m  Open the starter todo to see when long agent plans should become tracked work\n'
printf '\033[36m●\033[0m  Open the starter scratchpad for longer notes, plans, and handoffs\n'
printf '\033[32m●\033[0m  \033[1mCmd+K\033[0m opens the command palette\n'
printf '\033[92m●\033[0m  \033[1mCmd+E\033[0m opens the jump palette\n'
printf '\033[94m●\033[0m  \033[1mCmd+T\033[0m opens the new-item picker\n'
printf '\033[35m●\033[0m  Right-click items for context menus\n'
printf '\033[96m●\033[0m  \033[1mAuto-restart\033[0m shows auto-restart in action\n'
printf '\033[31m●\033[0m  \033[1mNotifications\033[0m demos toast & native alerts\n'
printf '\n'
printf "When you're ready, add your own project with \033[1mCmd+O\033[0m\n"
printf '\n'

SECONDS_LEFT=30
while [ "$SECONDS_LEFT" -gt 0 ]; do
  printf "\r\033[90mExiting in %2ss...\033[0m" "$SECONDS_LEFT"
  sleep 1
  SECONDS_LEFT=$((SECONDS_LEFT - 1))
done
printf "\r\033[90mExiting now.                \033[0m\n"
