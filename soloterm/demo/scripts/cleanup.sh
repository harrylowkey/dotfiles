#!/bin/sh
printf '\n'
printf '\033[1mRemoving the demo project\033[0m\n'
printf '\n'
printf "When you're done exploring, remove this demo:\n"
printf '\n'
printf '  Right-click \033[1mWelcome to Solo\033[0m in the sidebar → \033[1mRemove Project\033[0m\n'
printf '\n'
printf "\033[90mThe demo won't come back once removed.\033[0m\n"
printf '\n'
I=15
while [ "$I" -ge 1 ]; do
  printf "\r  Exiting in ${I}s... "
  I=$((I - 1))
  sleep 1
done
printf '\r                    \r'
