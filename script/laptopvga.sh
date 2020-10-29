#!/bin/sh
#笔记本和vga, vga 在 lvds 的右边
# xrandr
xrandr --output LVDS-1-1 --primary --output VGA-1-1 --mode 1920x1080 --right-of LVDS-1-1
