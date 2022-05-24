#!/bin/bash

echo "Copying local neovim config files..."
rm -r .config/nvim
cp -r ~/.config/nvim ./.config/nvim
