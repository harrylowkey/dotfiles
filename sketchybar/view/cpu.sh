#!/usr/bin/env sh

sketchybar -m --add item cpu left                         \
              --set cpu update_freq=5                      \
                    cpu script="$PLUGIN_DIR/cpu.sh"        \

