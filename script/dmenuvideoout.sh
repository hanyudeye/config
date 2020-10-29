#!/bin/bash
# vim: filetype=sh

dual_display() {
    case $1 in
    "Left")
      xrandr --output HDMI-1 --auto --left-of eDP-1 --output eDP-1 --auto --primary
      ;;
    "Right")
        xrandr --output HDMI-1 --auto --right-of eDP-1 --output eDP-1 --auto --primary
        ;;
    "up")
        xrandr --output HDMI-1 --auto --up-of eDP-1 --output eDP-1 --auto --primary
        ;;
    "down")
        xrandr --output HDMI-1 --auto --down-of eDP-1 --output eDP-1 --auto --primary
        ;;
    "*") echo "Good luck!";;
    esac
}

OPTS="1: Built-in Display\n2: External Display\n3: Extendend Mode\n4: Mirror Mode\n5: Manual"

case $(echo -e $OPTS|dmenu -i -p "Change video output:") in
    "1: Built-in Display")
        xrandr --output HDMI-1 --off --output eDP-1 --auto
        ;;

    "2: External Display")
        xrandr --output HDMI-1 --auto --output eDP-1 --off
        ;;

    "3: Extendend Mode")
        dual_display $(echo -e "Left\nRight" | dmenu -i -p "Second display at:")
        ;;

    "4: Mirror Mode")
        xrandr --output HDMI-1 --auto --output eDP-1 --auto
        ;;

    "5: Manual")
        arandr
        ;;

    "*")
        echo "Good luck!"
        ;;
esac
