set nocompatible
set nobackup
set noswapfile
set nowrap
set number
set nostartofline
set showcmd
set showmode
set tildeop
set title
set clipboard=unnamed
set scrolloff=10

" encoding
set encoding=utf-8 nobomb
set fileencoding=utf-8

" search
set ignorecase
set incsearch
set hlsearch

" indent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent
set list
set listchars=tab:»·,trail:·,nbsp:·,eol:¬

" tab switching
noremap [ gT
noremap ] gt

" syntax
syntax on
highlight NonText ctermfg=lightgrey
highlight SpecialKey ctermfg=lightgrey
highlight LineNr ctermfg=lightgrey
