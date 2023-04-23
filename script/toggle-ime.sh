#!/bin/bash
CURRENT_WIN=$(xdotool getactivewindow)
EMACS=$(xdotool search --classname --onlyvisible emacs)

if echo $EMACS|grep -q $CURRENT_WIN; then
    # xdotool key --delay 300 ctrl+backslash # 效果不好，会出现吞 ctrl 按键，发送失灵的情况
    xdotool getactivewindow key ctrl+backslash # 稳定，不吞 ctrl
else
    # 但是在 terminal 下不可以正常工作，
    fcitx-remote -t
fi
