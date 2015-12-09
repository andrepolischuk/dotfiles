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

" Encoding
set encoding=utf-8 nobomb
set fileencoding=utf-8

" Automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

" Search
set ignorecase
set incsearch
set hlsearch

" Indent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent
set smartindent
set list
set listchars=tab:»·,trail:·,nbsp:·,eol:¬

" Shortcuts for moving between tabs
noremap [ gT
noremap ] gt

" Syntax
syntax on
highlight NonText ctermfg=lightgrey
highlight SpecialKey ctermfg=lightgrey
highlight LineNr ctermfg=lightgrey

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on
