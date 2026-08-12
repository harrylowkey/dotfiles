#!/bin/sh
printf 'This simulates a running dev server.\n'
printf '\033[33mCompiling...\033[0m\n'
sleep 2
printf '\033[32m✓ Compiled successfully in 1.2s\033[0m\n'
printf '\n'
printf '  \033[1mLocal:\033[0m   http://localhost:3000\n'
printf '  \033[1mNetwork:\033[0m http://192.168.1.42:3000\n'
printf '\n'
N=0
while true; do
  TS=$(date '+%H:%M:%S')
  N=$((N + 1))
  M=$((N % 20))
  if [ "$M" -eq 7 ]; then
    printf "\033[90m$TS\033[0m  \033[36m[HMR]\033[0m  Updated \033[4msrc/App.tsx\033[0m\n"
  elif [ "$M" -eq 3 ] || [ "$M" -eq 13 ]; then
    printf "\033[90m$TS\033[0m  \033[33m304\033[0m  GET /assets/style.css  \033[90m(1ms)\033[0m\n"
  elif [ "$M" -eq 11 ]; then
    printf "\033[90m$TS\033[0m  \033[32m200\033[0m  POST /api/data  \033[90m(45ms)\033[0m\n"
  else
    printf "\033[90m$TS\033[0m  \033[32m200\033[0m  GET /  \033[90m(3ms)\033[0m\n"
  fi
  sleep 1
done
