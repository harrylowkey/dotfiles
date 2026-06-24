#!/usr/bin/env sh

sketchybar -m --add item docker left                         \
              --set docker update_freq=5                     \
                    icon=󰡨                                   \
                    icon.font="$LABEL:Bold:14"               \
                    cpu script="$PLUGIN_DIR/docker.sh"       \
                    click_script="$PLUGIN_DIR/toggle_docker.sh" \
