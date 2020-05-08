# Antigen plugins
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle tmux
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme agnoster

antigen apply

# Env
export ZSH="$HOME/.oh-my-zsh"

# Path
typeset -U path
path=(
    $HOME/bin
    /usr/local/bin
    $path
)


# Bindings
# vi mode
bindkey -v

# navigate tab-completion using vim keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# reverse shell search
bindkey '^R' history-incremental-search-backward

# Load other
source $ZSH/oh-my-zsh.sh
source ~/.shellrc
source ~/.alias.zshrc

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin
