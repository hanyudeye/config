# eg: bash /orb/Dev/BashScripts/setres.sh 200 125 
# Set multimonitor with multi-dpi with xrandr (eg NVidia cards)
# First set the scaling to something at least large enough (s.a. 200% in GNOME)
# In this case DVI-D-0 and HDMI-0 are 1080p monitors around DP-0 which is a 4K monitor

SCALE1=$(expr $1/100 | bc -l)
SCALE2=$(expr $2/100 | bc -l)

xrandr --output DP-0 --mode 1920x1080 --panning $((1920*$2/100))x$((1080*$2/100))+$((1920*$2/100+3840*$1/100))+0 --pos 3840x0 --rotate right --scale ${SCALE2}x${SCALE2} --output HDMI-0 --primary --mode 3840x2160 --panning $((3840*$1/100))x$((1080*$1/100))+$((1920*$2/100))+0 --pos 0x0 --rotate normal --scale ${SCALE1}x${SCALE1}
