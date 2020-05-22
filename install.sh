#!/bin/bash

check_dependencies() {
    echo "checking dependencies..."
    dependencies=(curl git)

    for d in $dependencies; do
        command -v $d > /dev/null 2>&1
        if [[ $? != 0 ]]; then
            echo "$d required to run install script."
            exit 1
        fi
    done
    echo "done."
}

brew_install() {
    echo "installing homebrew packages..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    brew tap homebrew/cask-fonts

    formulae=(nvim tmux zsh antigen stow node python)
    casks=(kitty firefox alfred rectangle hyperswitch karabiner-elements font-Hack notion)

    brew install ${formulae[@]}
    brew cask install ${casks[@]}
    echo "done."
}

omz_install() {
    echo "installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chmod -R 744 /usr/local/bin/zsh
    echo "done."
}

install_config() {
    echo "installing config files..."
    # tmux plugin manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # install vimplug for neovim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    rm $HOME/.zshrc

    # TODO: probably move everything that belongs in $HOME into 'home' and just stow the entire folder
    configs=(config shell zsh tmux)
    for cfg in ${configs[@]}; do
        stow $cfg
    done

    # TODO: move extra config files like zsh/autosuggestion-settings.zsh to where the belong

    echo "done."
}

install() {
    echo "install start..."
    check_dependencies
    brew_install
    omz_install
    install_config
    echo "install done."
    exit 0
}

install
