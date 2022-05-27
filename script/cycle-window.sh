#!/bin/bash

# @REF https://stackoverflow.com/questions/15172735/cycle-through-windows-of-the-same-application-using-wmcrtl
win_class=$1			# 'terminator' # $1

# get list of all windows matching with the class above
if [[ $win_class == "firefox" ]]; then
	win_list=$(wmctrl -x -l | grep -i "Navigator"\\.$win_class | awk '{print $1}' )
else
	win_list=$(wmctrl -x -l | grep -i $win_class\\.$win_class | awk '{print $1}' )
fi
echo win_list $win_list

# get id of the focused window
active_win_id=$(xprop -root | grep '^_NET_ACTIVE_W' | awk -F'# 0x' '{print $2}' | awk -F', ' '{print$1}')
#BUG: when a window id is 0x00***(wmctrl -xl output), but xprop -root _NET_ACTIVE_WINDOW return ***(少一个0)
#这就导致后面的操作不匹配，无法正确识别当前激活的窗口
echo active_win_id $active_win_id

# get next window to focus on, removing id active
# 注意下面 sed 命令要用双引号，而且 .* 这个正则表达式可以解决 active_win_id 开头是 0x00*** 的情况
switch_to=$(echo $win_list | sed "s/.*$active_win_id//" | awk '{print $1}')

# if the current window is the last in the list ... take the first one
if [ "$switch_to" == '' ];then
   switch_to=$(echo $win_list | awk '{print $1}')
fi
echo switch_to $switch_to


# switch to window
wmctrl -i -a $switch_to
