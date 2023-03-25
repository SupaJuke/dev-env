#!/bin/zsh

# DEPRECATED - Installing VimPlug
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copying the file over
if [[ -d "$HOME/.config/nvim" ]]
then
	rm -rf ~/.config/nvim
fi

if [[ ! -d "$HOME/.config/nvim" ]]
then
    mkdir ~/.config
fi
ln -s "$PWD/.dev-env/config/nvim" "$HOME/.config/nvim"
