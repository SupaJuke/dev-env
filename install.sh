#!/bin/zsh

## ------------ Initializing variables ------------- ##

ROOT_PATH=$(dirname $(readlink -f "$0"))

if [[ $# -ne 1 ]]
then
	echo "./install.sh <root password>"
	exit
fi

## --------------- Setting up ZSH ------------------ ##

./scripts/zsh.sh $ROOT_PATH

## --------------- Setting up System --------------- ##

if [[ $OSTYPE =~ 'darwin' ]]
then
	./scripts/macos.sh
elif [[ $OSTYPE =~ 'linux' ]]
then
	./scripts/ubuntu.sh $1
fi

## --------------- Setting up Neovim --------------- ##

./scripts/nvim.sh

## ---------------- Sourcing .zshrc ---------------- ##

exec zsh
