set columns=100
set lines=60
set guioptions-=T

set background=dark
set gfn=Ricty\ Regular\ for\ Powerline:h24
set gfw=Ricty\ Regular\ for\ Powerline:h24
let g:PowerLine_symbols = 'fancy'
set antialias

highlight CursorIM guibg=Purple guifg=NONE
"highlight Search guibg=DarkBlue guifg=NONE

map <D-w> :q<CR>gT
map <D-t> :tabnew<CR>
map <D-n> :new<CR>
map <D-S-t> :browse tabe<CR>
map <D-S-n> :browse split<CR>
map <D-]> :tabn<CR>
map <D-[> :tabp<CR>
map <D-M-Right> :tabn<CR>
map <D-M-Left> :tabp<CR>
imap <D-M-Right> <C-o>:tabn<CR>
imap <D-M-Left> <C-o>:tabp<CR>
