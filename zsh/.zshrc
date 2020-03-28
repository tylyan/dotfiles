export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

typeset -U path
path=(
    $HOME/bin
    /usr/local/bin
    $path
)

plugins=(
    git
    tmux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Vi mode
bindkey -v

# Navigate tab-completion using vim keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Reverse shell search
bindkey '^R' history-incremental-search-backward

source ~/.shellrc
source ~/.alias.zshrc
