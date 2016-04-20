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

" Remember info about open buffers on close
set viminfo^=%

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

" Aliases
cnoreabbrev Q q!
cnoreabbrev nt tabnew

" Encoding
set encoding=utf-8 nobomb
set fileencoding=utf-8

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

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-sleuth'
Plugin 'ervandew/supertab'

" Search
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
  let g:ctrlp_show_hidden=1
  let g:ctrlp_custom_ignore='\v[\/](\.(git|hg|svn)|node_modules)$'

" Languages
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled=1
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'stephenway/postcss.vim'

au BufRead *.json set filetype=javascript
au BufRead,BufNewFile *.es6 set filetype=javascript

" Vundle end
call vundle#end()

" Syntax
syntax on
colorscheme zen
hi NonText ctermfg=lightgrey
hi SpecialKey ctermfg=lightgrey
hi LineNr ctermfg=lightgrey
filetype plugin indent on
