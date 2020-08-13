

let g:NERDTreeCopyCmd= 'cp -r '
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.swp$', '\~$', 'node_modules']
let NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Ctrl+ww cycle though all windows
"Ctrl+wh takes you left a window
"Ctrl+wj takes you down a window
"Ctrl+wk takes you up a window
"Ctrl+wl takes you right a window
