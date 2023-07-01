#!/bin/bash

#killall -q polybar # Terminate already running bar instances
# If all your bars have ipc enabled, you can also use
polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# polybar top 2>&1 | tee /tmp/polybar_t.log & disown
# polybar bottom 2>&1 | tee /tmp/polybar_b.log & disown
#polybar top 2>&1 >/dev/null & disown
#polybar bottom 2>&1 >/dev/null & disown

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    POLYBARMONITOR=$m polybar --reload top & disown
  done
else
  polybar --reload top & disown
fi
