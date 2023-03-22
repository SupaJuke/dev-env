## --------------- Initializing variables ------------------ ##

if [[ $# -ne 1 ]]
then
	echo "./install.sh <sudo password>"
	exit
fi

## --------------- Setting up ZSH ------------------ ##

./scripts/omz.sh
cp config/.zshrc ~/.zshrc

## --------------- Setting up System --------------- ##

if [[ $OSTYPE =~ 'darwin' ]]
then
	./scripts/macos.sh
elif [[ $OSTYPE =~ 'linux' ]]
then
	./scripts/ubuntu.sh $1
fi

## --------------- Setting up Neovim --------------- ##

./scripts/nvim.sh

# NOTE: Still have to run PlugInstall manually
# And other plugins setups -> TSInstall; CocInstall
