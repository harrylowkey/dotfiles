#!/bin/sh
printf '\033[1mAgents and terminals\033[0m\n'
printf '\n'
printf '\033[4mAgents\033[0m\n'
printf 'Agents run AI models like Claude directly inside Solo, alongside your other processes.\n'
printf '\n'
printf 'Solo auto-detects coding agents installed on your system and uses their CLIs directly.\n'
printf 'Nothing runs through our servers — your tokens stay on your machine.\n'
printf '\n'
printf 'Add an agent by clicking \033[1m+ Add agent\033[0m in the sidebar.\n'
printf '\n'
printf '\033[4mTerminals\033[0m\n'
printf 'Terminals give you a blank interactive shell whenever you need one.\n'
printf 'Launch one by clicking \033[1m+ Add terminal\033[0m in the sidebar.\n'
printf '\n'
I=15
while [ "$I" -ge 1 ]; do
  printf "\r  Exiting in ${I}s... "
  I=$((I - 1))
  sleep 1
done
printf '\r                    \r'
