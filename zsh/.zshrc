# =============================================================================
# Environment Variables
# =============================================================================
export EDITOR="nvim"
export ZPLUG_HOME="$HOME/.zplug"
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export FZF_HOME="$HOME/.fzf"
export FZF_DEFAULT_COMMAND="fd --type file --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"
export NVM_DIR="$HOME/.nvm"
export PNPM_HOME="/Users/tommy/Library/pnpm"
export BUN_INSTALL="$HOME/.bun"

# =============================================================================
# Path Configuration
# =============================================================================
typeset -U path
path=(
    $HOME/bin
    $BUN_INSTALL/bin
    $PNPM_HOME
    /usr/local/bin
    /usr/local/opt/openjdk/bin
    $path
)

# =============================================================================
# Auto-installers
# =============================================================================
[[ ! -d $ZPLUG_HOME ]] \
    && { echo "Installing zplug..."; curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh }

[[ ! -d $FZF_HOME ]] \
    && { echo "Installing fzf..."; git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_HOME && $FZF_HOME/install }

# =============================================================================
# History Settings
# =============================================================================
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# =============================================================================
# Keybindings
# =============================================================================
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

# =============================================================================
# Plugins (zplug)
# =============================================================================
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

# =============================================================================
# Tool Initializations
# =============================================================================
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Nord directory colors
# [MacOS] need to homebrew `coreutils` and use `gdircolors`: https://github.com/arcticicestudio/nord-dircolors/issues/7
test -r ~/.dir_colors && eval $(gdircolors ~/.dir_colors)

# nvm (lazy loaded)
nvm() {
  unset -f nvm node npm npx
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  nvm "$@"
}
node() { nvm use default; node "$@"; }
npm() { nvm use default; npm "$@"; }
npx() { nvm use default; npx "$@"; }

# zoxide
eval "$(zoxide init zsh)"

# local env
. "$HOME/.local/bin/env"

# =============================================================================
# Aliases
# =============================================================================
# File operations
alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"

# Directory listing
# [MacOS] need to use GNU ls for gdircolors: https://github.com/arcticicestudio/nord-dircolors/issues/7
alias ls="gls --color=always"
alias l="ls -FGlAhp"
alias ll="eza -alh"

# Navigation
alias cd="z"

# Tools
alias less="less -FSRXc"
alias tmux="tmux -2"
alias vim="nvim"

# Config shortcuts
alias path="echo -e ${PATH//:/\\n}"
alias zconf="vim $HOME/.zshrc"

# Git
alias g="git"
alias gs="git status"
alias gd="git diff"

# Package managers
alias y="yarn"

# =============================================================================
# Functions
# =============================================================================
git() {
  if [[ "$1" == "diff" ]]; then
    command git diff --color=always "${@:2}" | less -r
  elif [[ "$1" == "log" ]]; then
    command git log --color=always "${@:2}" | less -r
  else
    command git "$@"
  fi
}

# =============================================================================
# Completions
# =============================================================================
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# bun
[ -s "/Users/tommy/.bun/_bun" ] && source "/Users/tommy/.bun/_bun"
