#!/bin/sh
printf 'Beats five times, then auto-restarts.\n'
printf '\033[1mHeartbeat monitor\033[0m\n'
printf '\n'
I=1
while [ "$I" -le 5 ]; do
  TS=$(date '+%H:%M:%S')
  printf "\033[90m$TS\033[0m  \033[32m♥\033[0m  Heartbeat $I/5\n"
  I=$((I + 1))
  sleep 2
done
printf '\n'
printf '\033[33mDone — Solo will restart this automatically.\033[0m\n'
