set nocompatible

set enc=utf-8
set fenc=utf-8
set fencs=utf-8,euc-jp,cp932,iso-2022-jp,ucs-bom,utf-16,utf-16le,utf-16be
set ambiwidth=double

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set textwidth=0

set number
set list
set listchars=tab:>-,trail:-
set ruler
set showmatch
set wrap
set title
set showcmd
set cmdheight=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ [POS=%04l,%04v]
set wildmenu

set backspace=2
set formatoptions+=mM
let format_join_spaces = 4
let format_allow_over_tw = 1
set nobackup
set history=1000
set mouse=
set modeline
set modelines=3

if has('migemo')
    set migemo
endif
if has('kaoriya')
    set iminsert=0 imsearch=0
    set noimdisableactivate
endif

filetype plugin indent on
syntax on
hi Search term=reverse ctermbg=DarkBlue ctermfg=NONE
autocmd FileType vim set tabstop=2 tw=0 sw=2 expandtab
autocmd FileType ruby set tabstop=2 sts=2 tw=0 sw=2 expandtab
autocmd FileType eruby set tabstop=2 sts=2 tw=0 sw=2 expandtab
autocmd BufNewFile,BufRead app/*/*.rhtml set ft=mason fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.rb set ft=ruby fenc=utf-8
autocmd BufNewFile,BufRead app/**/*.yml set ft=ruby fenc=utf-8
autocmd FileType c hi Comment ctermfg=darkcyan
autocmd FileType cpp hi Comment ctermfg=darkcyan
autocmd FileType php set tabstop=4 sts=4 tw=0 sw=4 expandtab

" rubycomplete.vim
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" search
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" do nothing
nnoremap Q <Nop>

" edit binary file
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" text
autocmd FileType text setlocal textwidth=0

if has('multi_byte_ime') || has('xim')
  highlight Cursor guifg=NONE guibg=White
  highlight CursorIM guifg=NONE guibg=DarkRed
endif

" matchit
source $VIMRUNTIME/macros/matchit.vim

" vim-plug
call plug#begin('~/.vim/plugged')
"Plug 'Shougo/neobundle.vim'
"Plug 'Shougo/vimproc.vim'
"Plug 'Shougo/vimshell'
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/neomru.vim'
"Plug 'Shougo/neosnippet.vim'
Plug 'scrooloose/syntastic.git'
"Plug 'kakkyz81/evervim.git'
"Plug 'tyru/open-browser.vim'
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
"Plug 'vim-scripts/vim-auto-save'
"Plug 'syui/cscroll.vim'
Plug 'kana/vim-submode'
"Plug 'Rykka/riv.vim'
"Plug 'Rykka/InstantRst'
"Plug 'rizzatti/dash.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'bronson/vim-trailing-whitespace'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'elixir-lang/vim-elixir'
if has('lua')
  Plug 'Shougo/neocomplete.vim'
endif

call plug#end()

" local settings
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

"" vimproc
"if has('mac')
"    let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
"elseif has('win32')
"    let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win32.dll'
"elseif has('win64')
"    let g:vimproc_dll_path = $HOME . '.vim/bundle/vimproc/autoload/vimproc_win64.dll'
"endif

" unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" solarized
syntax enable
set background=dark
let g:solarized_termcolor = 256
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
let g:solarized_termtrans = 1
colorscheme solarized

" vim-gitgutter
"nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
"nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<CR>

" colorize 80 column
"if (exists('+colorcolumn'))
"    set colorcolumn=80
"    highlight ColorColumn ctermbg=9
"endif

"" evervim
"nnoremap ,el :EvervimNotebookList<CR>
"nnoremap ,es :EvervimSearchByQuery<space>
"nnoremap ,ec :EvervimCreateNote<CR>
"nnoremap ,et :EvervimListTags<CR>

"" Markdown Preview
"" <F7>でプレビュー
"nnoremap <silent> <F7> :PrevimOpen<CR>

" vim-markdown
let g:vim_markdown_folding_disabled=1
