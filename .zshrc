# Add these lines into ~/.zshrc
# [[ -f ~/.dotfiles/.zshrc ]] && source ~/.dotfiles/.zshrc
# export SPACESHIP_CONFIG="$HOME/.dotfiles/zsh/spaceship.zsh"

# My Alias
[[ -f ~/.dotfiles/alias/alias.sh ]] && source ~/.dotfiles/alias/alias.sh

# Customize PROMPT
if [[ $ZSH_THEME == "robbyrussell" ]]; then
    PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )$(whoami)@$(hostname -f)"
    PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
fi
# https://github.com/caiogondim/bullet-train.zsh
if [[ $ZSH_THEME == "bullet-train" ]]; then
    BULLETTRAIN_PROMPT_ORDER=(time context status dir git)
fi

# fix bug git_prompt_info: character not in range
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
