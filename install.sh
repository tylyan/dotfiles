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

    formulae=(coreutils nvim tmux zsh stow node python)
    casks=(kitty alfred rectangle karabiner-elements font-Hack visual-studio-code)

    brew install ${formulae[@]}
    brew install --cask ${casks[@]}
    echo "done."
}


install_config() {
    echo "installing config files..."
    # tmux plugin manager
    [[ ! -d ~/.tmux/plugins/tpm ]] \
        && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # install vimplug for neovim
    [[ ! -d "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]] \
        && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    rm -f $HOME/.zshrc

    # TODO: probably move everything that belongs in $HOME into 'home' and just stow the entire folder
    configs=(config zsh tmux)
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
    install_config
    echo "install done."
    exit 0
}

install
