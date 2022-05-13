# @REF: https://github.com/masasam/dotfiles
# 最近发现 emacs 自带的 dired 就可以很方便的建立 symlink

test:
	echo ${PWD}
	echo ${HOME}

tmux:
	ln -sf ${PWD}/tmux/tmux.conf ${HOME}/.tmux.conf

bash:
	ln -sf ${PWD}/config/bash ${HOME}/.config/bash

i3:
	ln -sf ${PWD}/config/i3 ${HOME}/.config/i3

bspwm:
	ln -sf ${PWD}/config/bspwm ${HOME}/.config/bspwm
