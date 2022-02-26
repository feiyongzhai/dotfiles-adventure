# @REF: https://github.com/masasam/dotfiles

test:
	echo ${PWD}
	echo ${HOME}

emacs:
	ln -sf ${PWD}/emacs/.emacs.d ${HOME}/.emacs.d # use ``ln -r`` to create symbolic link by relative path

tmux:
	ln -sf ${PWD}/tmux/.tmux.conf ${HOME}/.tmux.conf

bash:
	ln -sf ${PWD}/.config/bash ${HOME}/.config/bash

vim:
	ln -sf ${PWD}/vim/.vim ${HOME}/.vim

i3:
	ln -sf ${PWD}/.config/i3 ${HOME}/.config/i3

bspwm:
	ln -sf ${PWD}/.config/bspwm ${HOME}/.config/bspwm
