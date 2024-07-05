> [!NOTE]
> I switched to NixOS so this repo will not be updated, at least until I ragequit NixOS.

# Personal .dotfiles (managed by GNU Stow)

## Installation
1. Install stow: `pacman -S stow` (for arch)
2. Clone this repository to `~`
3. `./stow_all.sh`

## (Not working atm) - Neovim
Because my neovim configuration is divided into independent modules, I have three different variants of neovim.

One is used as an IDE, second one is used for note-taking, third for simple file editing.
Each of these variants import different modules (plugins, options), making them work different.

#### Neovim - Code: `nvim -u ~/.config/nvim/code.lua`
- importing `common` + `code` modules
- (alias `code`)
- Native LSP, Debugging, Telescope...
#### Neovim - Note: `nvim -u ~/.config/nvim/note.lua`
- importing `common` + `note` modules
- (alias `note`)
- Neorg, remote storage
#### Neovim - Edit: `nvim -u ~/.config/nvim/init.lua`
- importing `common` module
- (no alias)
