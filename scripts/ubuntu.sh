#!/bin/zsh

# Updating Dependencies
echo $1 | sudo -Sk apt-get update

# Installing apt-fast
echo $1 | sudo -Sk add-apt-repository ppa:apt-fast/stable
echo $1 | sudo -Sk apt-get update
echo $1 | sudo -Sk DEBIAN_FRONTEND=noninteractive apt-get install -y apt-fast  # need testing

# Autocomplete for apt-fast
# curl https://raw.githubusercontent.com/ilikenwf/apt-fast/master/completions/zsh/_apt-fast > /usr/share/zsh/functions/Completion/Debian/_apt-fast
# cp completions/zsh/_apt-fast /usr/share/zsh/functions/Completion/Debian/
# chown root:root /usr/share/zsh/functions/Completion/Debian/_apt-fast
# source /usr/share/zsh/functions/Completion/Debian/_apt-fast

# Installing Dependencies (mainly for Neovim)
echo $1 | sudo -Sk apt-fast install -y make
echo $1 | sudo -Sk apt-fast install -y gcc
echo $1 | sudo -Sk apt-fast install -y g++
echo $1 | sudo -Sk apt-fast install -y bat  # batcat -> bat
echo $1 | sudo -Sk apt-fast install -y fd-find  # fdfind -> fd
echo $1 | sudo -Sk apt-fast install -y fzf
echo $1 | sudo -Sk apt-fast install -y ripgrep

# Installing Latex
# echo $1 | sudo -Sk apt-fast install -y texlive-latex-extra

# Install Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
echo $1 | sudo -Sk apt install -y ./nvim-linux64.deb

# Clean Up Artifacts
rm ripgrep*.deb nvim*.deb
