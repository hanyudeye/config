# hdmi开关,开 on 关 off ,关了就可以用耳机了

if [ "$#" -eq 1 ]; then
    if [ "$1" = "on" ]; then
        pacmd set-card-profile 0 output:hdmi-stereo
    else 
        pacmd set-card-profile 0 off
        pacmd set-card-profile 1 output:analog-stereo
     fi   
else
    echo "请输入 on 或 off 来开启或关闭 hdmi 声卡"
fi
