#! /bin/bash

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

# Change default SHELL
install_zsh()
{
    if [[ ! $(grep /zsh$ /etc/shells) ]]; then
        send_message "Start installing Zsh."
        OS_INFO=`awk -F '=' '/PRETTY_NAME/ { print $2 }' /etc/os-release`
        if grep -q "Ubuntu" <<< "$OS_INFO"; then
            sudo apt-get install -y zsh
        else
            yum install -y zsh
        fi
        send_message "Zsh installed successfully"
    else
        send_message "Zsh are installed already."
    fi
}

change_shell()
{
    install_zsh
    if [[ $SHELL != $(which zsh) ]]; then
        chsh -s $(which zsh) $(whoami)
        send_message "Zsh is default shell now. Exit and open your terminal again."
        sleep 2
    else
        send_message "Your current shell is Zsh already. Nothing changes."
    fi
}

install_ohmyzsh() {
    install_zsh
    sleep 2
    clear
    if [[ ! -d ~/.oh-my-zsh ]]; then
        send_message "Start installing Oh-My-Zsh..."
        $(which bash) -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}

install_ohmyzsh_conf()
{
    if [[ -f ~/.zshrc ]]; then
        # if [[ -L "$ZSH_FILE_LOCAL" ]]; then # Symbolic link
        #     unlink $ZSH_FILE_LOCAL
        #     ln -s ${DF}$ZSH_FILE $ZSH_FILE_LOCAL
        # else
        #     ln -s ${DF}$ZSH_FILE $ZSH_FILE_LOCAL
        # fi
        # Configurations
        send_message "Start settings configurations for Oh-My-Zsh..."
        CONFIG_LIST=(
            "[[ -f ~/.dotfiles/.zshrc ]] && source ~/.dotfiles/.zshrc"
            "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=22'"
        )
        i=0
        while [ "${CONFIG_LIST[i]}" != "" ]; do
            CONFIG=${CONFIG_LIST[i]}
            if (( ! $(cat ~/.zshrc | grep "$CONFIG" | wc -l) > 0 ))
            then
                echo $CONFIG >> ~/.zshrc
            fi
            i=$((i+1))
        done
        # Change theme
        sed -i -e "s/ZSH_THEME=\".*\"/ZSH_THEME=\"bullet-train\"/g" ~/.zshrc
        send_message "Configurations installed successfully."

        # Plugins
        send_message "Install additional plugins..."
        if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        fi
        if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        fi

        # Install & config spaceship-prompt
        git clone https://github.com/spaceship-prompt/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1
        ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme
        ln -s ~/.dotfiles/zsh/spaceship.zsh $HOME/.config/spaceship.zsh

        send_message "Updating plugins list..."
        plugins="git rsync zsh-autosuggestions zsh-syntax-highlighting"
        sed -i -e "s/plugins=(.*)/plugins=($plugins)/g" ~/.zshrc
        send_message "Finished updating plugins list."
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

install_fonts()
{
    FONT_DIR="$HOME/fonts"
    git clone https://github.com/powerline/fonts.git --depth=1 $FONT_DIR
    cd $FONT_DIR
    ./install.sh
    rm -rf $FONT_DIR
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
    all_ohmyzsh
    all_vim
}

isUpdate=$1
if [[ $isUpdate == "true" ]]; then
    cd ~/.dotfiles/
    git pull origin master
    all
    clear
    send_message "Updated successfully!"
    sleep 2
    exit
fi

# Main Menu
clear
selection=
until [ "$selection" = "0" ]; do
    echo "
    PROGRAM MENU
    1 - Install OhMyZsh
    2 - Install OhMyZsh Configs
    3 - Install Vim Plug
    4 - Install Powerline Fonts
    5 - Install All In One

    0 - exit program
"
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
        1 ) clear; install_ohmyzsh ;;
        2 ) clear; install_ohmyzsh_conf ;;
        3 ) clear; all_vim ;;
        4 ) clear; install_fonts ;;
        5 ) clear; all ;;
        0 ) exit ;;
        * ) clear; echo "Please enter 1, 2, 3, 4 or 0"
    esac
done
