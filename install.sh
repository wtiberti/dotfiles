#!/bin/sh
set -u

cp .bash_aliases .bashrc $HOME
cp .tmux.conf .vimrc $HOME
cp init.vim $HOME/.config/nvim/init.vim
cp sxhkd $HOME/.config
cp bspwm $HOME/.config
cp i3 $HOME/.config
cp polybar $HOME/.config

echo "dotfiles installed"
