#!/bin/sh

#
# Installing packages from brew
#

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

brew install gnu-sed

# Containers
brew install helm
brew install docker
brew install kubectl

# Development
brew install go

brew install python

brew install node
brew install typescript