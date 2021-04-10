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
export EDITOR="nvim"
export VIMRC="$HOME/.config/nvim/init.vim"
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
set -o vi
bindkey -v

# navigate tab-completion using vim keys
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# reverse shell search
bindkey '^R' history-incremental-search-backward

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias cp='cp -iv'
alias l='ls -FGlAhp'
alias less='less -FSRXc'
alias ll='ls -FGlAhp'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias omz='vim $HOME/.oh-my-zsh'
alias path='echo -e ${PATH//:/\\n}'
alias vim='nvim'
alias zconf='vim $HOME/.zshrc'
cd() { builtin cd "$@"; ll; }

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin
