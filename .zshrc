export ZSH="/Users/tommy/.oh-my-zsh"
ZSH_THEME="agnoster"

#############
# PATH
#############

typeset -U path
path=(
    $HOME/bin
    /usr/local/bin
    /usr/local/opt/go/libexec/bin
    /usr/local/opt/python/libexec/bin
    $path
)

#############
# PLUGINS
#############
plugins=(
    git
    tmux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#############
# SETTINGS
#############
export EDITOR='vim'
set -o vi

if [[ -r ~/.aliasrc ]]; then
    . ~/.aliasrc
fi

export GOPATH=$HOME/go
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#############
# KEYBINDS
#############
# Navigate tab-completion using vim keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Reverse shell search
bindkey -v
bindkey '^R' history-incremental-search-backward

#############
# CONDA
#############
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tommy/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tommy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tommy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tommy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

