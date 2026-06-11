#!/usr/bin/env sh

#交换ctrl 和 capslock
setxkbmap -option "ctrl:swapcaps"

# 自动代理 ssh
ssh-add ~/.ssh/coding_rsa
ssh-add ~/.ssh/github_rsa

# xrandr --output LVDS-1-1 --primary --output VGA-1-1 --right-of LVDS-1-1
