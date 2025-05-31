#!/bin/zsh

# Checking provided password
# [TODO]: use read to read password instead
# read -s "var?Text"
ROOT_PATH=$1
if [[ $# -ne 1 ]]; then
    echo "ROOT_PATH not provided: ./$(basename $0) <ROOT_PATH>"
    exit
fi

read -s "PASSWORD?Input your root password: "
if [[ ! $(echo $PASSWORD | sudo -Sk echo 'authorized' | xargs) =~ 'authorized' ]]; then
    echo "Root password incorrect"
    exit
fi

# Updating Dependencies
echo $PASSWORD | sudo -Sk apt-get update

# Installing apt-fast
# echo $PASSWORD | sudo -Sk add-apt-repository ppa:apt-fast/stable
# echo $PASSWORD | sudo -Sk apt-get update
# echo $PASSWORD | sudo -Sk DEBIAN_FRONTEND=noninteractive apt-get install -y apt-fast # need testing

# Quick install apt-fast (need curl & wget)
/bin/bash -c "$(curl -sL https://git.io/vokNn)"

# Installing Dependencies (mainly for Neovim)
echo $PASSWORD | sudo -Sk apt-fast install -y make gcc g++ bat fd-find ripgrep
wget -O fzf.tar.gz https://github.com/junegunn/fzf/releases/download/v0.62.0/fzf-0.62.0-linux_amd64.tar.gz
tar -xvzf fzf.tar.gz
echo $PASSWORD | sudo -Sk mv fzf /usr/bin/fzf
rm fzf.tar.gz

# Install Latex
# echo $PASSWORD | sudo -Sk apt-fast install -y texlive-latex-extra

# Install Neovim
wget -O nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
if [[ ! -d "$HOME/.local/bin" ]]; then
    mkdir -p $HOME/.local/bin
fi
ln -s "$ROOT_PATH/squashfs-root/usr/bin/nvim" "$HOME/.local/bin/nvim"
rm nvim.appimage
