#!/usr/bin/env bash

red="0xffed8796"
green="0xffa6da95"

if pgrep -x "OrbStack" >/dev/null; then
    sketchybar --set "$NAME" label="running  |" label.color=$green icon.color=$green
else
    sketchybar --set "$NAME" label="stopped  |" label.color=$red icon.color=$red
fi
