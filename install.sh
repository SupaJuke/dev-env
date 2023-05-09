#!/bin/zsh

## ------------ Initializing variables ------------- ##

ROOT_PATH=$(dirname $(readlink -f "$0"))

## --------------- Setting up ZSH ------------------ ##

./scripts/zsh.sh $ROOT_PATH

## --------------- Setting up System --------------- ##

if [[ $OSTYPE =~ 'darwin' ]]; then
	./scripts/macos.sh
elif [[ $OSTYPE =~ 'linux' ]]; then
	./scripts/ubuntu.sh $1 $ROOT_PATH
fi

## --------------- Setting up Neovim --------------- ##

./scripts/nvim.sh

## ---------------- Sourcing .zshrc ---------------- ##

exec zsh
