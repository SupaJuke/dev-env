#!/bin/zsh

## ------------ Initializing variables ------------- ##

if [[ $# -ne 1 ]]
then
	echo "./install.sh <sudo password>"
	exit
fi

## --------------- Setting up ZSH ------------------ ##

./scripts/zsh.sh $1

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
