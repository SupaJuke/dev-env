#!/bin/zsh

# Initialize Variable
ROOT_PATH=$1
if [[ $# -ne 1 ]]; then
    echo "root path to repo not provided: ./$(basename $0) <root_path>"
    exit
fi

if [[ ! -d "$ROOT_PATH/config/zsh" ]]; then
    echo "zsh folder not contained in at $ROOT_PATH/config/zsh"
    exit
fi

# Installing OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Installing Plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Removing old .zshrc
if [[ -f "$HOME/.zshrc" ]]; then
    rm "$HOME/.zshrc"
fi

# Creating zshenv file
echo "ZDOTDIR=$ROOT_PATH/config/zsh" >"$HOME/.zshenv"

# Symlinking
ln -s "$ROOT_PATH/config/zsh/.zshrc" "$HOME/.zshrc"
