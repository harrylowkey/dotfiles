#!/usr/bin/env sh

source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"

icon_map "${INFO}"

# Nerd Font icon overrides for apps not in sketchybar-app-font. These render with
# a Nerd Font instead of the app-font, so icon.font is switched alongside.
icon_font="sketchybar-app-font:Regular:17.0"
case "$INFO" in
  "Aside")    icon_result=""; icon_font="Hack Nerd Font:Regular:16.0" ;;   # nf-dev-browserstack U+E76B
  "Superset") icon_result="󰵰"; icon_font="Hack Nerd Font:Regular:16.0" ;; # U+F0D70
esac

sketchybar --set $NAME label="$INFO /" icon="$icon_result" icon.font="$icon_font"
