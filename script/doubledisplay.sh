#!/bin/sh
# xrandr --output LVDS-1-1 --primary --output HDMI-1-1 --mode 1920x1080 --right-of LVDS-1-1
# xrandr --output DP-0 --primary --mode 1920x1080 --left-of HDMI-0

xrandr --output DP-0 --primary --dpi 220 --left-of HDMI-0  --dpi 125

# 1920x1080
# 3840x2160

# xrandr --output DP-0 --dpi 220
# xrandr --output DP-0 --primary --dpi 220 --left-of HDMI-0

xrandr --output DP-0 --scale 0.45x0.45 --left-of HDMI-0 

# xrandr --output DP-0 --primary --dpi 220 --left-of HDMI-0  --dpi 125

# xrandr --output "DP-4" --primary --pos "0x0" --scale 0.5x0.5 \
#     --output "DP-2" --pos "3840x0" \
#     --output eDP-1-1 --off

# 0.45x0.45

xrandr --dpi 276 --fb 7040x3960 --output eDP-1 --mode 3200x1800 --output DP-1-2 --scale 2x2 --pos 3200x0 --panning 3840x2160+3200+0


xrandr --dpi 276 --fb 7680x4320 --output DP-0 --mode 3840x2160 --output HDMI-0 --scale 2x2 --pos 3840x0 --panning 3840x2160+3200+0

xrandr --dpi 276 --fb 7680x4320 --output DP-0 --mode 3840x2160 --output HDMI-0 --scale 2x2 --pos 3840x0 

xrandr --dpi 176 --output DP-0 --mode 3840x2160 --auto --output HDMI-0 --scale 2x2 --pos 3840x0  --auto 

3840x2160
1920x1080
# 5760x3240

7680x4320


双显示器

xrandr --dpi 276 --fb 7040x3960 \
       --output eDP-1 --mode 3200x1800 \
       --output DP-1-2 --scale 2x2 --pos 3200x0 --panning 3840x2160+3200+0

单显示器

xrandr --dpi 276 --fb 3840x2160 \
       --output eDP-1 --off \
       --output DP-1-2 --scale 2x2 --panning 3840x2160

xrandr --dpi 276 --fb 3840x2160 \
       --output eDP-1 --off \
       --output DP-1-2 --scale 2x2 --panning 3840x2160

