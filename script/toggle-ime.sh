#!/bin/bash
CURRENT_WIN=$(xdotool getactivewindow)
EMACS=$(xdotool search --name 'GNU Emacs')

if echo $EMACS|grep -q $CURRENT_WIN; then
    # emacs -Q;
    xdotool key --delay 100 Ctrl+backslash
else
    fcitx-remote -t
fi
