#!/bin/bash
# 双屏不同的壁纸
shopt -s nullglob

# 壁纸放置目录 如需更改壁纸目录请更改~/Pictures/wallpaper为相应的存放目录
while true; do
    ## 竖屏壁纸检索出来
    cd ~/图片/wallpaper-vertically
    dir1="/home/wuming/图片/wallpaper-vertically/"
    files1=()
    for i in *.jpeg *.jpg *.png; do
        [[ -f $i ]] && c=$dir1$i && files1+=("$c")
    done
    range1=${#files1[@]}

    # 切换目录
    cd ~/图片/wallpaper
    dir="/home/wuming/图片/wallpaper/"

    files=()
    #图片后缀名
    for i in *.jpeg *.jpg *.png; do
        [[ -f $i ]] &&  c=$dir$i && files+=("$i")
    done
    range=${#files[@]}
    #随机
    ((range))  && ((range1)) && feh --bg-scale   "${files[RANDOM % range]}" "${files1[RANDOM % range1]}"
    # echo  "${files1[RANDOM % range1]}"
    #更换间隔时间 15m即是15分钟
    sleep 45m

done

# 另外一种脚本写法
# while true; do
# 	find ~/.wallpaper -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
# 		shuf -n1 -z | xargs -0 feh --bg-scale
# 	sleep 15m
# done
# 参见 https://wiki.archlinux.org/index.php/Feh_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
