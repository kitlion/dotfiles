if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

source ~/.dotfiles/vim/editor.vim
source ~/.dotfiles/vim/vim-plug.vim
source ~/.dotfiles/vim/configs/themes.vim
source ~/.dotfiles/vim/configs/nerdtree.vim
source ~/.dotfiles/vim/configs/vim-airline.vim
" source ~/.dotfiles/vim/configs/lightline.vim
source ~/.dotfiles/vim/configs/key-bindings.vim

" Front-End
source ~/.dotfiles/vim/configs/emmet.vim
