# My Favorite dotfiles

## Rerequisites
https://ohmyz.sh/

https://github.com/junegunn/vim-plug



## How to install
### Automate
```
git clone https://github.com/kitlion/dotfiles ~/.dotfiles/

~/.dotfiles/bootstrap.sh
```
Choose 1

Run again
```
~/.dotfiles/bootstrap.sh
```
Choose 2 and then 3, and 0 to Exit

Final step
```
source .zshrc
```

### Manual
```
git clone https://github.com/kitlion/dotfiles ~/.dotfiles/

echo "[[ -f ~/.dotfiles/.zshrc ]] && source ~/.dotfiles/.zshrc" >> ~/.zshrc

source ~/.zshrc
※ Follow instrction
```

## Others
If display as not expect, install these fonts
https://github.com/powerline/fonts

### On Mac, Linux
Follow instruction on GitHub

### On Windows
Install one of those font and set that font for your Terminal. 
Refer __Noto Mono__
