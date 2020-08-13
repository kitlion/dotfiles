#! /bin/bash

# DF=~"/.dotfiles/"
# echo $DF
# cd "$(dirname "${BASH_SOURCE}")";

# Change default SHELL
change_shell() {
    if [[ $SHELL == $(which zsh) ]]; then
        chsh -s $(which zsh) $(whoami)
        echo "Zsh is default shell now. Exit and open your terminal again."
    fi
}

install_ohmyzsh() {
    if [[ ! -d ~/.oh-my-zsh ]]; then
        echo "Start installing Oh-My-Zsh..."
        $(which bash) -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

install_ohmyzsh_conf() {
    if [[ -f ~/.zshrc ]]; then
        echo "[[ -f ~/.dotfiles/.zshrc ]] && source ~/.dotfiles/.zshrc" >> ~/.zshrc
        source ~/.zshrc
    fi
}

install_vim_plug() {
    if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
        $(which curl) -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        # install plugin
        $(which vim) -es -u vimrc -i NONE -c "PlugInstall" -c "qa"
    fi
}

# Vim folder
vim_folder() {
    mkdir -p ~/.vim/backups
    mkdir -p ~/.vim/swaps
    mkdir -p ~/.vim/undo
}

# change_shell
# install_ohmyzsh
# install_vim_plug
vim_folder
# install_ohmyzsh_conf

# unlink ~/.vimrc
# if [[ ! -f "~/.vimrc" ]]; then
# 	ln -s "${DF}.vimrc" ~/.vimrc
# fi
