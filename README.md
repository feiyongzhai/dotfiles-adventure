# 说明
1. 这个仓库主要是用于了解`git submodule`和`stow`配合使用能否更好的管理我的dotfiles
2. 也借此机会了解一下`git submodule`的工作逻辑

# 使用 make
```sh
make emacs
make vim
# 有时候会提示 emacs 已经是最新，而创建 emacs 的链接
# 这个时候可以添加一个 -B，如下
make emacs -B
```

# 使用 stow (过时了)
```sh
cd ~
git clone https://github.com/feiyongzhai/dotfiles-adventure.git dotfiles
cd dotfiles
stow -t ~ bash/ -v
stow -t ~ emacs/ -v
stow -t ~ vim/ -v
stow -t ~ vim/ -v -n # 用这个命令查看stow帮我们做了什么
```

