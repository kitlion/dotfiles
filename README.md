# My Favorite dotfiles

## What will be install?
https://ohmyz.sh/

https://github.com/zsh-users/zsh-autosuggestions

https://github.com/junegunn/vim-plug

## How to install
```
git clone https://github.com/kitlion/dotfiles ~/.dotfiles/

~/.dotfiles/bootstrap.sh
```
Choose 1 -> Wait until completed -> After install completed, press ```Ctrl D``` to Exit

Run again
```
~/.dotfiles/bootstrap.sh
```
Choose 2, 3 and then 4, and 0 to Exit

Final step
```
source .zshrc
```

## Update
```
dot-update
```

## Fonts
If display as not expect, install these fonts
https://github.com/powerline/fonts

### On Mac, Linux
Follow instruction on GitHub

### On Windows
Install one of those font and set that font for your Terminal.
Refer __Roboto Mono for Powerline__

After installed font, update your prefer terminal use new font family

#### iTerm
![Config iTerm](/img/iterm-config.png)

#### Terminal
![Terminal Bash](/img/terminal-config.png)

#### Git Bash
![Config Git Bash](/img/git-bash-config.png)


## Notes for Mac OS
### Brew source
Add into .zshrc
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### NVM
Add into .zprofile
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```
