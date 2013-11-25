" Essentials
set nocompatible
scriptencoding utf-8
set encoding=utf-8

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
set smartcase
set ignorecase
set showcmd
set hidden
set wildmenu
set nowrap
set path+=**

" Appearance
set cursorline
set display+=lastline
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
if exists('+backup')
  set backup
endif
au BufWritePre * let &bex = '-' . strftime("%Y%m%dT%H%M%S")

" Maps / Leader
cmap cd. cd %:p:h
cmap lcd. lcd %:p:h
cmap acki Ack -i 
cmap ackf AckFile -i 
cmap mkf wall \| make %:p:r
cmap mkp wall \| make %:p
cmap mkm wall \| make
nnoremap j gj
nnoremap k gk
nnoremap <silent> <C-L> :set hlsearch!<CR>
map <F4> :cnext<CR>
map <S-F4> :cprevious<CR>
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
nmap <C-tab> :bn<CR>
imap <C-tab> <ESC>:bn<CR>i
nmap <C-S-tab> :bn<CR>
imap <C-S-tab> <ESC>:bn<CR>i

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
    set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
else
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
endif

" History
set history=1000

" Colorscheme
let g:solarized_contrast="high"    "default value is normal
let g:solarized_visibility="low"   "default value is normal
let g:solarized_menu=0
set background=light
colorscheme solarized

" ctrlp options
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(ali|keep|o)$',
    \ }

