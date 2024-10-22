# Supa's Development Environment

This is Supa's development environment, which mainly consists of the followings:

- [ZSH](https://www.zsh.org/) with [Oh My Zsh](https://ohmyz.sh/)
- [Neovim](https://neovim.io/)
- [Brew](https://brew.sh/) (for Mac only)
- [Apt](https://ubuntu.com/server/docs/package-management) (for Ubuntu only)
- [Visual Studio Code](https://code.visualstudio.com/)

---

## Requirements

- ZSH (5.8.1+)
- Git (2.35.1+)
- curl

## Installation

Run `install.sh`. That should handle most stuffs. This will also trigger `p10k` configuration wizard to start after installing all dependencies.

~~For Neovim plugins, run `nvim`. Once inside, run `:PlugInstall` to install all plugins. For specific plugin configs (Treesitter & Coc), do `TSInstall <language>` and `CocInstall <language>`.~~

Before running `nvim`, make sure to install `node` (e.g. `nvm install --lts`). Then, you could run `nvim`, which will automatically install the plugins, including extensions for `treesitter`.

List of languages frequently used could be found in `lang-list.txt`.

---

## TODO

### Done

- [x] write 1 shell script that will call everything in order
- [x] make VSC configuration more refined
- [x] install dependencies for `apt` (Ubuntu)
- [x] Migrate from vim-plug to lazy.nvim
- [x] Setup Neoivm plugins automatically -> ~~[read](https://stackoverflow.com/questions/13522599/how-to-run-vim-commands-from-terminal)~~ Used Lazy to automatically install everything on first run

### In progress

**May 2022**

- [ ] latex installation (for both mac and ~~linux~~)

**March 2023**

- [ ] test running `install.sh` on Macos

### Abandoned

- ~~copy p10k configuration (and maybe for each OS -- linux/mac)~~ -> too trivial, better to just do it on the fly
- ~~clean install vs existing install? (for example vimplug should only be installed when clean install)~~
- ~~file line for NERDTree -> might not happen as we might~~ moved to ~~[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)~~ [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)

---

## Change Logs

### V3 (May 2024)

- Migrated from **coc** **nvim.lspconfig** and **mason**

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
