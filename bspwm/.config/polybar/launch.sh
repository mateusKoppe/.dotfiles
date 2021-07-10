#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

export DEFAULT_NETWORK_INTERFACE_WL=$(ip route | grep '^default' | awk '{print $5}' | grep 'wl' | head)
export DEFAULT_NETWORK_INTERFACE_EN=$(ip route | grep '^default' | awk '{print $5}' | grep 'en' | head)
export DEFAULT_BATTERY=$(ls -1 /sys/class/power_supply | grep 'BAT' | head)
export DEFAULT_BATTERY_ADAPTER=$(ls -1 /sys/class/power_supply | grep -v 'BAT' | head)

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log
# polybar main -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar1.log & disown

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar main -c ~/.config/polybar/config.ini &
  done
else
  polybar main &
fi

echo "Bars launched..."
