# 台式机，设置分辨率为2k
# xrandr --output HDMI-0 --auto  --mode 2560x1440  --primary --output DP-0 --auto --right-of HDMI-0
# 两个横排
# xrandr --output HDMI-0 --auto  --primary --output DP-0 --mode 2560x1440  --right-of HDMI-0

# 竖排+衡排
xrandr --output HDMI-0 --rotate left  --output DP-0 --mode 2560x1440  --primary --right-of HDMI-0



# HDMI-0 connected 1920x1080+3840+0
# DP-0 connected 3840x2160+0+0
