#!/bin/sh
set -u

cp .bash_aliases .bashrc $HOME
cp .tmux.conf .vimrc $HOME

if [ ! -d $HOME/.config/nvim ]; then
	mkdir -p $HOME/.config/nvim
fi
cp init.vim $HOME/.config/nvim/init.vim

echo "dotfiles installed"
