#!/bin/zsh

# Checking provided password
# [TODO]: use read to read password instead
# read -s "var?Text"
PASSWORD=$1
if [[ $# -ne 2 ]]; then
    echo "super user password not provided: ./$(basename $0) <sudo password> <ROOT_PATH>"
    exit
fi

if [[ ! $(echo $PASSWORD | sudo -Sk echo 'authorized' | xargs) =~ 'authorized' ]]; then
    echo "sudo password incorrect"
    exit
fi

# Updating Dependencies
echo $PASSWORD | sudo -Sk apt-get update

# Installing apt-fast
echo $PASSWORD | sudo -Sk add-apt-repository ppa:apt-fast/stable
echo $PASSWORD | sudo -Sk apt-get update
echo $PASSWORD | sudo -Sk DEBIAN_FRONTEND=noninteractive apt-get install -y apt-fast # need testing

# Autocomplete for apt-fast
# curl https://raw.githubusercontent.com/ilikenwf/apt-fast/master/completions/zsh/_apt-fast > /usr/share/zsh/functions/Completion/Debian/_apt-fast
# cp completions/zsh/_apt-fast /usr/share/zsh/functions/Completion/Debian/
# chown root:root /usr/share/zsh/functions/Completion/Debian/_apt-fast
# source /usr/share/zsh/functions/Completion/Debian/_apt-fast

# Installing Dependencies (mainly for Neovim)
echo $PASSWORD | sudo -Sk apt-fast install -y make
# echo $PASSWORD | sudo -Sk apt-fast install -y make -> TODO: add multiple packages in one call
echo $PASSWORD | sudo -Sk apt-fast install -y gcc
echo $PASSWORD | sudo -Sk apt-fast install -y g++
echo $PASSWORD | sudo -Sk apt-fast install -y bat     # batcat -> bat
echo $PASSWORD | sudo -Sk apt-fast install -y fd-find # fdfind -> fd
echo $PASSWORD | sudo -Sk apt-fast install -y fzf
echo $PASSWORD | sudo -Sk apt-fast install -y ripgrep

# Install Latex
# echo $PASSWORD | sudo -Sk apt-fast install -y texlive-latex-extra

# Install Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
if [[ ! -d "$HOME/.local/bin" ]]; then
    mkdir -p $HOME/.local/bin
fi
ln -s "$2/squashfs-root/usr/bin/nvim" "$HOME/.local/bin/nvim"
rm nvim.appimage
