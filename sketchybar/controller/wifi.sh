#!/usr/bin/env sh

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
CURR_IP="$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep -o "lastTxRate: .*" | sed 's/^lastTxRate: //')"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //' | awk '{for(i=1; i<=NF; i++) printf "%s",substr($i,1,1)}')"

WIFIACTIVEICON=􀙇
WIFIINACTIVEICON=􀙈

if [ "$CURR_TX" = "" ]; then
	sketchybar --set $NAME icon=$WIFIINACTIVEICON label="disconnected |"
else
    SPEED=$(awk -v num="$CURR_TX" 'BEGIN{ printf "%.2f MBps", num/8 }')
	sketchybar --set $NAME icon=$WIFIACTIVEICON label="$SSID $SPEED |"
fi
