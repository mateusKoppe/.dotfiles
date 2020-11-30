#!/usr/bin/env bash

killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar main &
  done
else
  killall -q polybar
  polybar main &
fi

echo "Bars launched..."
