# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------ Settings ------------------------------ #

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"
export ZSH="$HOME/.oh-my-zsh"
export MANPAGER='nvim +Man!'
export BAT_THEME="base16"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	docker
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#NVM
lazynvm() {
  	unset -f nvm node npm npx yarn nvim
  	export NVM_DIR=~/.nvm
  	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

nvm() {
    lazynvm 
    nvm $@
}

node() {
    lazynvm
    node $@
}

npm() {
    lazynvm
    npm $@
}

npx() {
    lazynvm
    npx $@
}

yarn() {
    lazynvm
    yarn $@
}

nvim() {
    lazynvm
    nvim $@
}

# ------------------------------ Aliasing ------------------------------ #

if [[ $OSTYPE =~ 'linux' ]]
then
	alias bat="batcat"
fi
