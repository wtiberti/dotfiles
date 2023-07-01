#!/bin/sh
set -u

TO_HOME=./.bashrc ./.bash_aliases ./.tmux.conf ./.vimrc
#TO_CONFIG=./.i3 ./.polybar ./.nvim
TO_CONFIG=./.nvim

# Copy to home
for f in ${TO_HOME}; do
	cp -ri $f $HOME/
done

# Directory check
if [ ! -d $HOME/.vim/autoload ]; then
	mkdir -p $HOME/.vim/autoload
fi

if [ ! -d $HOME/.config/nvim ]; then
	mkdir -p $HOME/.config/nvim
fi

# ...

# Copy to .config
for f in ${TO_CONFIG}; do
	cp -ri $f $HOME/
done

# Other
cp ./plug.vim $HOME/.vim/autoload
cp -r ./.local/* $HOME/.local

echo "dotfiles installed"
