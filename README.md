# Supa's Development Environment

This is Supa's development environment, which mainly consists of the following configurations:

- [Oh My Zsh](https://ohmyz.sh/)
- [Neovim](https://neovim.io/)
- [Brew](https://brew.sh/) (for mac only)
- [Visual Studio Code](https://code.visualstudio.com/)

## Requirements

- ZSH (5.8.1+)
- Git (2.35.1+)

## Installation

Run `install.sh`. That should handle most stuffs.

For Neovim plugins, run `nvim`. Once inside, run `:PlugInstall` to install all plugins. For specific plugin configs (Treesitter & Coc), do `TSInstall <language>` and `CocInstall <language>`.

List of languages frequently used could be found in `lang-list.txt`.

## TODO

### Done

- [x] write 1 shell script that will call everything in order
- [x] make VSC configuration more refined

### In progress

23 May 2022

- [ ] install dependencies for `apt` (Ubuntu)
- [ ] latex installation (for both mac and linux)
- [ ] file line for NERDTree -> might not happen as we might move to [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

21 March 2023

- [ ] Setup Neoivm plugins automatically -> [read](https://stackoverflow.com/questions/13522599/how-to-run-vim-commands-from-terminal)
- [ ] Migrate from vim-plug to lazy.nvim

### Abandoned

- ~~[ ] copy p10k configuration (and maybe for each OS -- linux/mac)~~ -> too trivial, better to just do it on the fly
- ~~[ ] clean install vs existing install? (for example vimplug should only be installed when clean install)~~

## Updates (23 May 2022)

- Installed the following plugins:
  - coc
  - coc-tabnine
  - fzf (on nvim)
  - fzf-preview -> ignore?
  - bat (better cat)

## Updates (21 March 2023)

- Removed Neovim configs from repo
- Restructured folders
- Implemented `install.sh` as a one-stop service
- Updated `README.md`
