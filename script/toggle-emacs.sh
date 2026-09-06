#!/bin/bash
WIN_ID=$(wmctrl -l | grep -i "emacs" | grep -v "grep" | awk '{print $1}' | head -1)
if [ -z "$WIN_ID" ]; then
  exit 1
fi
WIN_STATE=$(xprop -id "$WIN_ID" _NET_WM_STATE 2>/dev/null | grep -c '_NET_WM_STATE_HIDDEN')
if [ "$WIN_STATE" -eq 1 ]; then
  wmctrl -ia "$WIN_ID"
else
  xdotool windowminimize "$WIN_ID"
fi
