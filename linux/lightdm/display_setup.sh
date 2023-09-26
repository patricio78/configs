#!/bin/bash -x

xrandr --output eDP-1-1 --off
#xrandr --addmode DP-0.1.1 2560x1440
#xrandr --addmode DP-0.8 2560x1440
xrandr --output DP-0.1.1 --mode 2560x1440 
xrandr --output DP-0.1.1 --primary
xrandr --output DP-0.8 --mode 2560x1440 --right-of DP-0.1.1
