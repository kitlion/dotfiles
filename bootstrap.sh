#! /bin/bash

# DF=~"/.dotfiles/"
# echo $DF
# cd "$(dirname "${BASH_SOURCE}")";

# Change default SHELL
chsh -s $(which zsh) $(whoami)

# Vim folder
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/undo


# unlink ~/.vimrc
# if [[ ! -f "~/.vimrc" ]]; then
# 	ln -s "${DF}.vimrc" ~/.vimrc
# fi
