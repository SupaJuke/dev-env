PWD=$1

# Updating Dependencies
echo $PWD | sudo -Sk apt-get update

# Installing apt-fast
echo $PWD | sudo -Sk add-apt-repository ppa:apt-fast/stable
echo $PWD | sudo -Sk DEBIAN_FRONTEND=noninteractive apt-get install -y apt-fast  # need testing
cp completions/zsh/_apt-fast /usr/share/zsh/functions/Completion/Debian/
chown root:root /usr/share/zsh/functions/Completion/Debian/_apt-fast
source /usr/share/zsh/functions/Completion/Debian/_apt-fast

# Installing packages
echo $PWD | sudo -Sk apt-fast install -y texlive-latex-extra
echo $PWD | sudo -Sk apt-fast install -y bat
echo $PWD | sudo -Sk apt-fast install -y ca-certificates

# Install Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
echo $PWD | sudo -Sk apt install -y ./nvim-linux64.deb

# Install Ripgrep (for telescope)
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
echo $PWD | sudo -Sk apt install -y ./ripgrep_13.0.0_amd64.deb
