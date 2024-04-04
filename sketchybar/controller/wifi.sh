#!/usr/bin/env sh

# remember to install this repo first
# https://github.com/chbrown/macos-wifi?fbclid=IwAR1yyXoNcnIgUQftropmqz2poGwLo4Qh6aJkX6Cg0VZ-IC4nAuXbk4d9p_g_aem_AaKTiU6RLzyqTspErQIi_sy84te_6063ilRMZOWNhLTyI99fqRXrINNNUusYAuT6QEKETfmvN2RCLNGTibvftERu

WIFIACTIVEICON=􀙇
WIFIINACTIVEICON=􀙈

CURRENT_WIFI="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"
SSID="$(echo "$CURRENT_WIFI" | awk '{for(i=1; i<=NF; i++) printf "%s",substr($i,1,1)}')"

if [ "$SSID" = "" ]; then
  sketchybar --set $NAME label="Disconnected |" icon=$WIFIINACTIVEICON
else
  CURR_TX=$(/usr/local/bin/wifi | grep "TransmitRate" | awk -F ':' '{print $2}' | awk '{$1=$1};1')
  SPEED=$(awk -v num="$CURR_TX" 'BEGIN{ printf "%.2f MBps", num/8 }')

  sketchybar --set $NAME label="$SSID $SPEED |" icon=$WIFIACTIVEICON
fi
