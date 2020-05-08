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

    formulae=(vim tmux zsh antigen stow)
    casks=(kitty alfred rectangle hyperswitch hammerspoon font-Hack)

    brew install ${formulae[@]}
    brew cask install ${casks[@]}
    echo "done."
}

omz_install() {
    echo "installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "done."
}

install_config() {
    echo "installing config files..."
    # TODO: install config files using stow

    configs=(shell zsh vim tmux)
    echo "done."
}

install() {
    echo "install start..."
    check_dependencies
    brew_install
    omz_intall
    echo "install done."
    exit 0
}

install
