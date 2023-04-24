#!/bin/bash

# 但是在 xfce4-terminal 下不可以正常工作，

## 2023-04-24:
# 在实验室电脑上安装 xfce4.12 桌面并在 deepin-terminal 和 xfce4-terminal
# 尝试这个脚本，发现 deepin-terminal 工作正常，xfce4-terminal 工作不正常。
# 初步定位问题和 xfce4-terminal 相关，此时在 xfce4-terminal 中执行命令
# fcitx-remote -t 可以成功切换输入法状态。若使用 fcitx 自己的 Ctrl+Space
# 快捷键可以正常切换
#
# 进一步安装 kitty 进行测试：发现 kitty 下也无法切换，同时使用命令 fcitx-remote -t
# 也无法切换。

CURRENT_WIN=$(xdotool getactivewindow)
EMACS=$(xdotool search --classname --onlyvisible emacs)

if echo $EMACS|grep -q $CURRENT_WIN; then
    # xdotool key --delay 300 ctrl+backslash # 效果不好，会出现吞 ctrl 按键，发送失灵的情况
    xdotool getactivewindow key ctrl+backslash # 稳定，不吞 ctrl
else
    fcitx-remote -t
fi
