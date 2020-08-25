#! /bin/bash
# Uninstall

DF=$(dirname `which $0`)
VIM_FILE="/.vimrc"
VIM_CONFIG=$HOME$VIM_FILE
ZSH_FILE="/.zshrc"
ZSH_FILE_LOCAL=$HOME"/.zshrc.local"

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
    if [ "$1" != "" ]; then
        message=$1
    fi
    echo $message
    progress
}

change_shell()
{
    if [[ $SHELL != $(which bash) ]]; then
        chsh -s $(which bash) $(whoami)
        send_message "Bash is default shell now. Exit and open your terminal again."
        sleep 2
    fi
}

uninstall_vim_conf()
{
    if [[ -L "$VIM_CONFIG" ]]; then # Unlink Symbolic link
        unlink $VIM_CONFIG
    fi
    send_message "Vim's configurations removed."
}

uninstall_fzf()
{
    ~/.fzf/uninstall
    send_message "FZF removed."
}

all()
{
    change_shell
    uninstall_vim_conf
    uninstall_fzf
}

# Main Menu
clear
selection=
until [ "$selection" = "0" ]; do
    echo "
    PROGRAM MENU
    1 - Uninstall FZF
    2 - Uninstall VIM configs
    3 - Change SHELL to Bash
    4 - Install All In One

    0 - exit program
"
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) clear; uninstall_fzf ;;
        2 ) clear; uninstall_vim_conf ;;
        3 ) clear; change_shell ;;
        4 ) clear; all ;;
        0 ) exit ;;
        * ) clear; echo "Please enter 1, 2, 3, 4 or 0"
    esac
done
