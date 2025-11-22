# dotfiles

Personal macOS configuration files managed with GNU Stow.

## Quick Start

```bash
./install.sh
```

This installs Homebrew, essential tools, and symlinks all configs to `$HOME`.

## What's Included

- **zsh**: vi-mode, zplug plugins, FZF integration
- **neovim**: lazy.nvim, LSP with Mason, telescope, treesitter, nvim-tree
- **tmux**: vi keybindings, TPM, custom prefix (C-a)
- **karabiner**: caps lock → control/escape
- **kitty**: terminal emulator config

## Manual Installation

```bash
stow config  # symlinks .config/* to ~/.config/
stow zsh     # symlinks .zshrc to ~/.zshrc
stow tmux    # symlinks .tmux.conf to ~/.tmux.conf
```

## Reload Configs

- zsh: `source ~/.zshrc`
- tmux: `prefix + r`
- nvim: `:Lazy sync` (for plugin updates)
