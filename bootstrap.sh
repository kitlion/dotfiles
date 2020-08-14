#! /bin/bash

DF=$(dirname `which $0`)
VIM_FILE="/.vimrc"
VIM_CONFIG=$HOME$VIM_FILE

progress()
{
    i=0;limit=20;char="=="
    if [ "$1" != "" ]; then
        limit=$1
    fi
    if [ "$2" != "" ]; then
        char=$2
    fi
    until [ "$i" == "$limit" ]; do
        printf $char
        i=$((i+1))
        sleep 0.03
    done
    echo ""
}

send_message()
{
    local message="Working..."
    # clear
    if [ "$1" != "" ]; then
        message=$1
    fi
    echo $message
    progress
}

# Change default SHELL
change_shell()
{
    if [[ ! $(grep /zsh$ /etc/shells) ]]; then
        send_message "Start installing Zsh."
        yum install -y zsh
        send_message "Zsh installed successfully"
    else
        send_message "Zsh are installed already."
    fi
    if [[ $SHELL != $(which zsh) ]]; then
        chsh -s $(which zsh) $(whoami)
        send_message "Zsh is default shell now. Exit and open your terminal again."
        sleep 2
    else
        send_message "Your current shell is Zsh already. Nothing changes."
    fi
}

install_ohmyzsh() {
    if [[ ! $(grep /zsh$ /etc/shells) ]]; then
        send_message "Start installing Zsh..."
        yum install -y zsh
        send_message "Zsh installed successfully."
    else
        send_message "Zsh are installed already."
    fi
    if [[ ! -d ~/.oh-my-zsh ]]; then
        send_message "Start installing Oh-My-Zsh..."
        $(which bash) -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

install_ohmyzsh_conf()
{
    if [[ -f ~/.zshrc ]]; then
        send_message "Start settings configurations for Oh-My-Zsh..."
        CONFIG="[[ -f ~/.dotfiles/.zshrc ]] && source ~/.dotfiles/.zshrc"
        if (( ! $(cat ~/.bashrc | grep "$CONFIG" | wc -l) > 0 ))
        then
            echo $CONFIG >> ~/.zshrc
            # source ~/.zshrc
            send_message "Configurations installed successfully."
        else
            send_message "Configurations already exists."
        fi
        sleep 2
    fi
    cp ~/.dotfiles/zsh/custom/themes/bullet-train.zsh-theme ~/.oh-my-zsh/custom/themes/
}

vim_folder()
{
    [[ ! -d ~/.vim/backups ]] && mkdir -p ~/.vim/backups
    [[ ! -d ~/.vim/swaps ]] && mkdir -p ~/.vim/swaps
    [[ ! -d ~/.vim/undo ]] && mkdir -p ~/.vim/undo
    [[ ! -d ~/.vim/colors ]] && mkdir -p ~/.vim/colors
    send_message "VIM's temporary folder are created."
    cp ~/.dotfiles/vim/colors/monokai.vim ~/.vim/colors/
}

install_vim_conf()
{
    if [[ -L "$VIM_CONFIG" ]]; then # Symbolic link
        unlink $VIM_CONFIG
        ln -s ${DF}$VIM_FILE $VIM_CONFIG
    elif [[ -f $VIM_CONFIG ]]; then # Already exists, backup current, make link to .dotfiles config
        mv $VIM_CONFIG $VIM_CONFIG".bk"
        ln -s ${DF}$VIM_FILE $VIM_CONFIG
    else
        ln -s ${DF}$VIM_FILE $VIM_CONFIG
    fi
    send_message "VIM configurations installed successfully."
}

install_vim_plug()
{
    if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
        $(which curl) -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    send_message "Start installing VIM's Plugin..."
    $(which vim) -u ~/.vimrc -i NONE -c "PlugInstall" -c "qa"
}

all_ohmyzsh()
{
    install_ohmyzsh
    install_ohmyzsh_conf
}

all_vim()
{
    vim_folder
    install_vim_conf
    install_vim_plug
}

all()
{
    change_shell
    all_ohmyzsh
    all_vim
}

# change_shell
# install_ohmyzsh
# install_vim_plug
# vim_folder
# install_ohmyzsh_conf
# install_vim_conf

# Main Menu
clear
selection=
until [ "$selection" = "0" ]; do
    echo "
    PROGRAM MENU
    1 - Install OhMyZsh
    2 - Install OhMyZsh Configs
    3 - Install Vim Plug
    4 - Install All In One

    0 - exit program
"
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) clear; install_ohmyzsh ;;
        2 ) clear; install_ohmyzsh_conf ;;
        3 ) clear; all_vim ;;
        4 ) clear; all ;;
        0 ) exit ;;
        * ) clear; echo "Please enter 1, 2, 3, 4 or 0"
    esac
done
