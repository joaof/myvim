set nocompatible
scriptencoding utf-8

" Pathogen
call pathogen#infect() 

" Programming
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Tab characters
set softtabstop=4 
set shiftwidth=4 
set tabstop=4 
set smarttab
set expandtab 

" Behavior
set autoindent
set backspace=indent,eol,start
set showmatch
set incsearch
set gdefault
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline
set smartcase
set ignorecase
set showcmd
set hidden
set wildmenu
set nowrap
set nolist
set listchars=tab:►\ ,eol:¬
set path+=**
set switchbuf=useopen

" Backup / Undo / Swap
let s:dir = '~/.vim/vimdata' 
if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap/,' . &directory
endif
if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup/,' . &backupdir
endif
if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo/,' . &undodir
endif
if exists('+undofile')
  set undofile
endif
au BufWritePre * let &bex = '-' . strftime("%Y%m%dT%H%M%S")

" Maps / Leader
cmap cd. cd %:p:h
cmap lcd. lcd %:p:h
cmap acki Ack -i 
cmap ackf AckFile -i 
cmap mkf make %:p
cmap mkp make
nnoremap j gj
nnoremap k gk
nnoremap <silent> <C-L> :set hlsearch!<CR>
map <F4> :cnext<CR>
map <S-F4> :cprevious<CR>

" Status line
set laststatus=2
if has("statusline")
    set statusline=
    set statusline+=%-3.3n\                          " buffer number
    set statusline+=%f\                              " filename
    set statusline+=%h%m%r%w                         " status flags
    set statusline+=\[%{strlen(&ft)?&ft:'none'}]     " file type
    set statusline+=\[%{strlen(&fenc)?&fenc:'none'}] " file encoding
    set statusline+=\[%{strlen(&ff)?&ff:'none'}]     " file format
    set statusline+=%=                               " right align remainder
    set statusline+=%-14(%l,%c%V%)                   " line, character
    set statusline+=%p%%                             " file position
endif 

" Font
if has('win32')
    set guifont=Consolas:h11:cANSI
else
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
endif

" History
set history=1000

" Maps

" Colorscheme
colorscheme peachpuff

