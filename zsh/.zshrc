export EDITOR="nvim"
export VIMRC="$HOME/.config/nvim/init.vim"
export ZPLUG_HOME="$HOME/.zplug"
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export FZF_HOME="$HOME/.fzf"
export FZF_DEFAULT_COMMAND="fd --type file --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

[[ ! -d $ZPLUG_HOME ]] \
    && { echo "Installing zplug..."; curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh }

[[ ! -d $FZF_HOME ]] \
    && { echo "Installing fzf..."; git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_HOME && $FZF_HOME/install }

# Path
typeset -U path
path=(
    $HOME/bin
    /usr/local/bin
    /usr/local/opt/openjdk/bin
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

bindkey "^ " autosuggest-accept

# Plugins
source $ZPLUG_HOME/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
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

# Activate fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Activate Nord directory colors
# [MacOS] need to homebrew `coreutils` and use `gdircolors`: https://github.com/arcticicestudio/nord-dircolors/issues/7
# Update to use `dircolors` on other systems
test -r ~/.dir_colors && eval $(gdircolors ~/.dir_colors)

# Aliases
alias cp="cp -iv"
# [MacOS] need to use GNU ls for gdircolors: https://github.com/arcticicestudio/nord-dircolors/issues/7
alias ls="gls --color=always"
alias l="ls -FGlAhp"
alias less="less -FSRXc"
alias ll="ls -FGlAhp"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias omz="vim $HOME/.oh-my-zsh"
alias path="echo -e ${PATH//:/\\n}"
alias tmux="tmux -2"
alias vim="nvim"
alias zconf="vim $HOME/.zshrc"
cd() { builtin cd "$@"; ll; }

autoload -Uz compinit && compinit
kitty + complete setup zsh | source /dev/stdin
