#!/usr/bin/env sh

sketchybar --add item disk left                              \
           --set disk script="$PLUGIN_DIR/disk.sh"            \
                      update_freq=30                           \
