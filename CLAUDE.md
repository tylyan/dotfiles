# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for managing macOS system configuration files using GNU Stow. The repository manages configurations for zsh, tmux, neovim, and various macOS applications.

## Architecture

### Directory Structure

The repository uses GNU Stow's package-based approach:
- **`config/`**: Contains `.config/` with application configs (karabiner, nvim, kitty, etc.)
- **`zsh/`**: Contains `.zshrc`, `.alias.zshrc`, and autosuggestion settings
- **`tmux/`**: Contains `.tmux.conf`
- **`vim/`**: Contains vim-related configurations
- **`install.sh`**: Main installation script

Each directory represents a "stow package" that will be symlinked to `$HOME` when `stow <package>` is executed.

### Key Configuration Files

- **zsh/.zshrc**: Uses zplug for plugin management; configures vi mode bindings, FZF integration, and PATH
- **config/.config/nvim/init.vim**: Neovim config using vim-plug; includes coc.nvim, vimwiki, NERDTree, FZF
- **config/.config/karabiner/karabiner.json**: Karabiner-Elements config that remaps caps_lock to control/escape
- **tmux/.tmux.conf**: Tmux config with vi keybindings, custom prefix (C-a), and TPM plugin manager

## Installation and Setup

### Initial Setup

Run the installation script to set up the entire environment:
```bash
./install.sh
```

This script:
1. Checks for dependencies (curl, git)
2. Installs Homebrew if not present
3. Installs formulae: coreutils, nvim, tmux, zsh, stow, node, python
4. Installs casks: kitty, alfred, rectangle, karabiner-elements, font-Hack, visual-studio-code, todoist
5. Installs tmux plugin manager (TPM)
6. Installs vim-plug for neovim
7. Runs `stow` on config, zsh, and tmux packages

### Manual Stowing

To selectively install configurations:
```bash
stow config   # Symlinks config/.config/* to ~/.config/
stow zsh      # Symlinks zsh/.zshrc to ~/.zshrc
stow tmux     # Symlinks tmux/.tmux.conf to ~/.tmux.conf
```

To remove symlinks:
```bash
stow -D <package>
```

## Testing Changes

After modifying configuration files:

- **Zsh**: `source ~/.zshrc` or restart terminal
- **Tmux**: Prefix + r (reloads config) or `tmux source-file ~/.tmux.conf`
- **Neovim**: `:source $MYVIMRC` or restart neovim, then `:PlugInstall` for new plugins

## Important Notes

- The repository uses git for version control; uncommitted changes include modifications to karabiner.json, nvim/init.vim, and .zshrc
- Zsh config auto-installs zplug and FZF on first run if not present
- Neovim uses coc.nvim for LSP/completion; config is in config/.config/coc/
- Many untracked config directories exist in config/.config/ (git, gh, fish, etc.) that are not currently version-controlled
