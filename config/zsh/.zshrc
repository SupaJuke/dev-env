# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------ Settings ------------------------------ #

export PATH="$PATH:$HOME/.local/bin"  # For fdfind & bat
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

# Lazynvm
source ${ZDOTDIR}/lazy_nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
P10K_PATH="$ZDOTDIR/.p10k.zsh"
[[ ! -f $P10K_PATH ]] || source $P10K_PATH

# Put WSL specific configs below:
if [[ $(uname -r) =~ 'WSL2' ]]; then
    # export BROWSER=wslview
fi

# fzf, fd, and rg
if [[ $OSTYPE =~ "darwin" ]] || [[ $(uname -a) =~ "wolf" ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
elif [[ $OSTYPE =~ "linux" ]]; then
    [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
    [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
fi
export FZF_DEFAULT_COMMAND="fd --type file --strip-cwd-prefix --follow --hidden --exclude .git --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ------------------------------ Aliasing ------------------------------ #

# bat
if [[ $OSTYPE =~ "linux" ]] && [[ ! -f "$HOME/.local/bin/bat" ]]
then
    [[ -f "/usr/bin/batcat" ]] && ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# Symlinking fdfind
if [[ $OSTYPE =~ "linux" ]] && [[ ! -f "$HOME/.local/bin/fd" ]]
then
    [[ -f "/usr/bin/fdfind" ]] && ln -s $(which fdfind) ~/.local/bin/fd
fi

