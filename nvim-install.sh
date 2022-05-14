#!/bin/bash

# Installing VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copying the file over
rm -r ~/.config/nvim || true
cp -r .config/nvim ~/.config/nvim
