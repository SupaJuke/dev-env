#!/bin/zsh

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------- Important Settings ------------------------- #

if [[ $OSTYPE =~ "darwin" ]] ; then
    export PATH="/opt/homebrew/bin:$PATH" 
    fpath+=(/opt/homebrew/share/zsh/site-functions)
fi

export PATH="$PATH:$HOME/.local/bin"    # For fdfind & bat
export PATH="$PATH:/usr/local/go/bin"   # Golang
export PATH="$PATH:$HOME/.cargo/bin"    # Rust


export ZSH="$HOME/.oh-my-zsh"
export MANPAGER='nvim +Man!'
export BAT_THEME="base16"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
)

DISABLE_AUTO_UPDATE=true
DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# IMPORTANT: source this before other binaries
source $ZSH/oh-my-zsh.sh

# ------------------------------ Aliasing ------------------------------ #

# Lazynvm
source $ZDOTDIR/lazy_nvm.sh

# Put WSL specific configs below:
if [[ $(uname -r) =~ 'WSL2' ]]; then
    # export BROWSER=wslview
fi

# Sourcing fzf, fd, and rg
if [[ $OSTYPE =~ "darwin" ]] || [[ $(uname -a) =~ "wolf" ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
elif [[ $OSTYPE =~ "linux" ]]; then
    source <(fzf --zsh)
fi

# Fzf settings
export FZF_DEFAULT_COMMAND="fd --type file --strip-cwd-prefix --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ------------------------------ Aliasing ------------------------------ #

# Bat
if [[ $OSTYPE =~ "linux" ]] && [[ ! -f "$HOME/.local/bin/bat" ]]
then
    [[ -f "/usr/bin/batcat" ]] && ln -s $(which batcat) ~/.local/bin/bat
fi

# Fdfind
if [[ $OSTYPE =~ "linux" ]] && [[ ! -f "$HOME/.local/bin/fd" ]]
then
    [[ -f "/usr/bin/fdfind" ]] && ln -s $(which fdfind) ~/.local/bin/fd
fi

# ------------------------------ Local Settings ------------------------ #

# Sourcing local .zshrc
[[ -f $ZDOTDIR/.zshrc_local ]] && source $ZDOTDIR/.zshrc_local

# ----------------------- Stuffs That Need to be Here ------------------ #

# Sourcing p10k
P10K_PATH="$ZDOTDIR/.p10k.zsh"
[[ ! -f $P10K_PATH ]] || source $P10K_PATH
