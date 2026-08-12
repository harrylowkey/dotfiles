#!/bin/sh
printf 'Click into this terminal to focus it.\n'
printf 'You should see a blue border across the top when it is focused.\n'
printf '\n'
printf 'Press Enter to start the demo... '
read -r _
printf '\n'
printf '\033[33m① Toast notification\033[0m\n'
printf 'Click on another process in the sidebar and wait to see the toast notification.\n'
printf '\n'
I=10
while [ "$I" -ge 1 ]; do
  printf "\r  Starting in ${I}s... "
  I=$((I - 1))
  sleep 1
done
printf '\r                    \r'
printf '\033]9;Hey! Come back to Notifications! Click me.\007'
printf '\033[32m✓ Toast sent! If you switched away, you saw it pop up.\033[0m\n'
printf '\n'
sleep 3
printf '\033[33m② Native notification\033[0m\n'
printf 'Switch to a \033[1mdifferent app\033[0m (Finder, Terminal, etc.), then wait.\n'
printf '\n'
I=15
while [ "$I" -ge 1 ]; do
  printf "\r  Starting in ${I}s...  "
  I=$((I - 1))
  sleep 1
done
printf '\r                     \r'
printf '\033]9;Solo is running in the background!\007'
printf '\033[32m✓ Native notification sent!\033[0m\n'
printf 'Click the desktop notification to jump back here.\n'
printf '\n'
printf '\033[90mIf you did not see a desktop notification, you may need to enable it in your system settings.\033[0m\n'
printf '\033[90mIf desktop notifications fail, Solo always falls back to toast notifications.\033[0m\n'
printf '\033[90mYou can rerun this demo to try again.\033[0m\n'
printf '\n'
printf '\033[90mNext up: in the sidebar, hover over the Colors process and press the play button.\033[0m\n'
sleep 86400
