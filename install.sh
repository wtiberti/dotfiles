#!/bin/sh
set -u -e

TO_HOME=./.bashrc ./.bash_aliases ./.tmux.conf ./.vimrc
#TO_CONFIG=./.i3 ./.polybar ./.nvim
TO_CONFIG=./.nvim

# Copy to home
for f in ${TO_HOME}; do
	/bin/cp -ri $f $HOME
done

# Directory check
if [ ! -d $HOME/.vim/autoload ]; then
	/bin/mkdir -p $HOME/.vim/autoload
fi

if [ ! -d $HOME/.config/nvim ]; then
	mkdir -p $HOME/.config/nvim
fi

# ...

# Copy to .config
for f in ${TO_CONFIG}; do
	/bin/cp -ri $f $HOME
done

# Other
/bin/cp ./plug.vim $HOME/.vim/autoload
/bin/cp -r ./.local/* $HOME/.local

/bin/echo "dotfiles installed"
