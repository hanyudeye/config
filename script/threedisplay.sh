#!/bin/sh
# 显示两个外置显示器，一个竖屏
# xrandr --output VGA-1-1 --primary --output HDMI-1-1 --mode 1920x1080 --right-of VGA-1-1 --output LVDS-1-1 --off

# xrandr --output VGA-1-1 --primary --rotate left --output HDMI-1-1 --mode 1920x1080 --off --right-of VGA-1-1 --output LVDS-1-1 --off

# xrandr --output VGA-1-1 --primary --rotate left  --output LVDS-1-1 --off
# xrandr --output VGA-1-1 --primary --rotate right --output HDMI-1-1 --mode 1920x1080 --right-of VGA-1-1 --output LVDS-1-1 --off

# xrandr --output VGA-1-1 --rotate right --output HDMI-1-1  --primary --mode 1920x1080 --right-of VGA-1-1 --output LVDS-1-1 --off
# xrandr --output HDMI-1-1  --primary --mode 1920x1080 --output VGA-1-1 --rotate right  --right-of HDMI-1-1 --output LVDS-1-1 --off
# xrandr --output HDMI-1-1  --primary  --output VGA-1-1 --rotate right  --right-of HDMI-1-1 --output LVDS-1-1 --off

# xrandr --output HDMI-1-1  --primary  --output VGA-1-1 --rotate right  --right-of HDMI-1-1 --output LVDS-1-1 --off


xrandr
# xrandr --output HDMI-1-1  --primary --mode 1920x1080 --output VGA-1-1 --rotate right  --right-of HDMI-1-1 --output LVDS-1-1 --off
xrandr --output HDMI-1-1  --primary --mode 1920x1080 --output VGA-1-1  --right-of HDMI-1-1 --output LVDS-1-1 --off

# xrandr --output HDMI-1-1  --primary --mode 1920x1080 --output VGA-1-1 --rotate normal --right-of HDMI-1-1 --output LVDS-1-1 --off
