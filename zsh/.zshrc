EDITOR="nvim"
VIMRC="$HOME/.config/nvim/init.vim"
ZPLUG_HOME="$HOME/.zplug"
ZSH_AUTOSUGGEST_USE_ASYNC=1
FZF_HOME="$HOME/.fzf"
FZF_DEFAULT_COMMAND="fd --type file --hidden --exclude .git"
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"

[[ ! -d $ZPLUG_HOME ]] \
    && { echo "Installing zplug..."; curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh }

[[ ! -d $FZF_HOME ]] \
    && { echo "Installing fzf..."; git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install }

# Path
typeset -U path
path=(
    $HOME/bin
    /usr/local/bin
    $path
)

# Bindings
bindkey -v

# navigate tab-completion using vim keys
zstyle ":completion:*" menu select
zmodload zsh/complist
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M menuselect "j" vi-down-line-or-history

# history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down

bindkey "^ " autosuggest-accept

# Plugins
source $ZPLUG_HOME/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "mafredri/zsh-async", use:async.zsh, from:github, defer:0
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "sharkdp/fd", from:gh-r, as:command, rename-to:fd, use:"*darwin*"
zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias cp="cp -iv"
alias l="ls -FGlAhp"
alias less="less -FSRXc"
alias ll="ls -FGlAhp"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias omz="vim $HOME/.oh-my-zsh"
alias path="echo -e ${PATH//:/\\n}"
alias tmux="TERM=xterm-256color tmux"
alias vim="nvim"
alias zconf="vim $HOME/.zshrc"
cd() { builtin cd "$@"; ll; }

autoload -Uz compinit && compinit
kitty + complete setup zsh | source /dev/stdin
