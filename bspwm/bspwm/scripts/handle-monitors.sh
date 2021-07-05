#!/bin/bash

if ! type "xrandr"; then
  bspc monitor -d I II III IV V VI VII VIII IX X
  echo "Couldn't find xrandr"
  exit
fi

## Sorted connected monitors from left to rigth
monitors=$(xrandr --query | grep " connected" | sed 's/\([[:graph:]]*\).*x[[:digit:]]\++\([[:digit:]]\+\).*/\2 \1/' | sort -n | cut -d " " -f2)
primary=$(xrandr --query | grep "primary" | cut -d " " -f1)
mon_count=$(xrandr --query | grep " connected" | wc -l)

workspaces=("I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X")
ws_count=${#workspaces[@]}
ws_monitor=$(($ws_count / $mon_count))
echo $ws_monitor $mon_count $ws_count
ws_mod=$(($ws_count % $mon_count))
ws_primary=$(($ws_monitor + $ws_mod))

ws_index=0
for m in $monitors; do
  ws_mon_count=$([ $m == $primary ] && echo $ws_monitor || echo $ws_primary)
  last_index=$(($ws_index + $ws_mon_count))
  bspc monitor $m -d ${workspaces[@]:$ws_index:$last_index}
  ws_index=$last_index
done

