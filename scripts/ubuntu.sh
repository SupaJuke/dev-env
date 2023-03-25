# Updating Dependencies
echo $1 | sudo -Sk apt-get update

# Installing apt-fast
echo $1 | sudo -Sk add-apt-repository ppa:apt-fast/stable
echo $1 | sudo -Sk apt-get update
echo $1 | sudo -Sk DEBIAN_FRONTEND=noninteractive apt-get install -y apt-fast  # need testing

# Autocomplete for apt-fast
curl https://raw.githubusercontent.com/ilikenwf/apt-fast/master/completions/zsh/_apt-fast > /usr/share/zsh/functions/Completion/Debian/_apt-fast
# cp completions/zsh/_apt-fast /usr/share/zsh/functions/Completion/Debian/
chown root:root /usr/share/zsh/functions/Completion/Debian/_apt-fast
source /usr/share/zsh/functions/Completion/Debian/_apt-fast

# Installing packages
echo $1 | sudo -Sk apt-fast install -y texlive-latex-extra
echo $1 | sudo -Sk apt-fast install -y bat
echo $1 | sudo -Sk apt-fast install -y ca-certificates
echo $1 | sudo -Sk apt-fast install -y fzf

# Install Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
echo $1 | sudo -Sk apt install -y ./nvim-linux64.deb

# Install Ripgrep (for telescope)
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
echo $1 | sudo -Sk apt install -y ./ripgrep_13.0.0_amd64.deb
