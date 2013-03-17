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
set list
set listchars=tab:▸\ ,eol:¬

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

" Shortcuts
cmap cd. cd %:p:h
cmap lcd. lcd %:p:h

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
    set guifont=Ubuntu_Mono:h11:cAnsi
else
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
endif

" History
set history=1000

" Maps
nnoremap j gj
nnoremap k gk
nnoremap <silent> <C-L> :set hlsearch!<CR>

