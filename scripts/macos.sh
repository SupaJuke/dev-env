#!/bin/zsh

## !! From my brother, Nate !! ##
## Source: https://github.com/natebwangsut ##

# Installing Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installing packages from brew
brew update && brew upgrade

################################################################################
# Tools
################################################################################

# Dependencies remover - since brew itself does not track deps
brew tap beeftornado/rmtree

# Utilities
brew install coreutils
brew install ffmpeg
brew install wget
brew install gnu-sed
brew install make

# Neovim
brew install nvim
brew install ripgrep
brew install fzf
# Run this -> $(brew --prefix)/opt/fzf/install
brew install bat
brew install fd

# Containers
# brew install helm
# brew install docker
# brew install kubectl

# Development
brew install go
brew install python
brew install node
brew install typescript
