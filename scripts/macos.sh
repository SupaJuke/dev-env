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
brew install nvim
brew install wget
brew install ripgrep
brew install ffmpeg
brew install gnu-sed
brew install fzf
brew install make

# Containers
brew install helm
brew install docker
brew install kubectl

# Development
brew install go
brew install python
brew install node
brew install typescript
