#!/bin/sh
printf '\033[1mTerminal color test\033[0m\n'
printf 'Full color support inside the Solo terminal.\n'
printf '\n'
printf '\033[4mStandard 16 colors\033[0m\n'
I=0
while [ "$I" -le 7 ]; do
  printf "\033[48;5;${I}m  \033[0m"
  I=$((I + 1))
done
printf '\n'
I=8
while [ "$I" -le 15 ]; do
  printf "\033[48;5;${I}m  \033[0m"
  I=$((I + 1))
done
printf '\n\n'
printf '\033[4m256-color palette\033[0m\n'
I=16
while [ "$I" -le 231 ]; do
  printf "\033[48;5;${I}m \033[0m"
  MOD=$(((I - 15) % 36))
  if [ "$MOD" -eq 0 ]; then
    printf '\n'
  fi
  I=$((I + 1))
done
printf '\n\n'
printf '\033[4mGrayscale ramp\033[0m\n'
I=232
while [ "$I" -le 255 ]; do
  printf "\033[48;5;${I}m  \033[0m"
  I=$((I + 1))
done
printf '\n\n'
printf '\033[4mTrue-color gradient (red → green)\033[0m\n'
I=0
while [ "$I" -le 79 ]; do
  R=$((255 - I * 255 / 79))
  G=$((I * 255 / 79))
  printf "\033[48;2;${R};${G};0m \033[0m"
  I=$((I + 1))
done
printf '\n'
I=15
while [ "$I" -ge 1 ]; do
  printf "\r  Exiting in ${I}s... "
  I=$((I - 1))
  sleep 1
done
printf '\r                    \r'
