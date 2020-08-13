" Global
map <C-F10> :Breakpoint<cr>
map <C-p> :Files<CR>
map ; :Buffers<CR>

" Split Screen
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>/ :split<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" ***** NERDTree *****

map <C-B> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" ***** END NERDTree *****


" Ignore FZF search .gitignore list files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
