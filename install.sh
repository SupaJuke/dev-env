## --------------- Initializing variables ------------------ ##

if [[ $# -ne 1 ]]
then
	echo "./install.sh <sudo password>"
	exit
fi

PASSWORD=$1

## --------------- Setting up ZSH ------------------ ##

source scripts/omz.sh
cp config/.zshrc ~/.zshrc

## --------------- Setting up Brew --------------- ##

if [[ $OSTYPE =~ 'linux' ]]
then
	source scripts/brew.sh
fi

## --------------- Setting up Neovim --------------- ##

if [[ $OSTYPE =~ 'linux' ]]
then
	# Install Neovim
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
	echo $PASSWORD | sudo -Sk apt install --assume-yes ./nvim-linux64.deb

	# Install Ripgrep (for fzf-preview)
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
	echo $PASSWORD | sudo -Sk apt install --assume-yes ./ripgrep_13.0.0_amd64.deb
fi

source scripts/nvim.sh

# NOTE: Still have to run PlugInstall manually
# And other plugins setups -> TSInstall; CocInstall
