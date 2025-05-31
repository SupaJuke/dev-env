# Supa's Development Environment

This is Supa's development environment, which mainly consists of the followings:

- [ZSH](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/)
- [Neovim](https://neovim.io/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Windows Terminal](https://github.com/microsoft/terminal)

## Requirements

- ZSH
- Git
- curl
- wget

## Installation

Run `install.sh`. That should handle most stuffs. This will also trigger `p10k` configuration wizard to start after installing all dependencies.

**Before running `nvim`**, make sure to install `node` (e.g. `nvm install --lts`). Then, you could run `nvim`, which will automatically install the plugins, including extensions for `treesitter`.

List of languages frequently used could be found in `lang-list.txt`.

## Change Logs

### V3.5 (June 2025)

- Updated `ubuntu.sh`
- [TODO]: Migrate `neovim` to v0.11

### V3 (May 2024)

- Migrated from **coc** to **nvim.lspconfig** and **mason**

### V2 (March 2023)

**Main features**

- Implemented `install.sh` as a one-stop service
- Fully migrated to **Vimscript** to **Lua** and **VimPlug** to **Lazy**
- Setup additional plugins and colorschemes for Nvim (e.g. Telescope, autoformat by CoC, Tokyonight Palemoon for Windows Terminal)
- Tested the installation process on Ubuntu (22.04) & MacOS (Monterey Intel)
- ~~Included fonts (CaskaydiaCove & MonoLisa) to repo~~
- Include both .zshrc and .p10k.zsh in the repo and use it from there

**Other features**

- Updated `README.md`
- Now using symlink with configs (`.config/nvim` and `.zshrc`)
- Restructured folders

### V1 (May 2022)

- Installed the following plugins:
  - coc
  - coc-tabnine
  - fzf (on nvim)
  - fzf-preview -> ignore?
  - bat (better cat)
