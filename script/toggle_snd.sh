#!/bin/bash
#切换声卡
SND_PROFILE=""
analog_profile="output:analog-stereo+input:analog-stereo"
hdmi_profile="output:hdmi-stereo+input:analog-stereo"
if [ "$#" -eq 1 ]; then    
    if [ "$1" = "analog" ]; then
        SND_PROFILE=`pacmd list-cards | grep "output:analog.* available: unknown" | tail -n1 | awk -F" " '{print substr($1, 1, length($1) -1)}'`
        echo "Setting sound to analog: $SND_PROFILE"
    elif [ "$1" = "hdmi" ]; then
        HDMI=`xrandr | grep 'HDMI.* connected' | head -n 1 | awk '{print $1}'`
        echo "HDMI: $HDMI"
        HDMI_STR=`echo $HDMI | awk -F"-" '{print $1" "$2}'`
        if [ -z $HDMI ]; then
            echo "No HDMI found!"
        fi
        SND_PROFILE=`pacmd list-cards | grep "output:hdmi.*($HDMI_STR).* available: unknown" | head -n1 | awk -F" " '{print substr($1, 1, length($1) -1)}'`
        echo "Setting sound to hdmi: $SND_PROFILE"
    else
        echo "Only valid args \"hdmi\" or \"analog\""
        exit 1
    fi
    echo "SND_PROFILE: $SND_PROFILE"
    if [ -z $SND_PROFILE ]; then
        echo "No sound card profile found!"
    else
        pacmd set-card-profile 0 $SND_PROFILE
        echo "Changed the sound profile to $1"
    fi        
else
    echo "Number of arguments expected: 1"
fi
