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
Plugin 'tpope/vim-sleuth'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  map <C-n> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  let NERDTreeHighlightCursorline=0
  let NERDTreeIgnore = []
  for suffix in split(&suffixes, ',')
    let NERDTreeIgnore += [ escape(suffix, '.~') . '$' ]
  endfor
  let NERDTreeIgnore += ['^\.git$', '^\.hg$', '^\.svn$', '^\.$', '^\.\.$', '^Thumbs\.db$', '^\.DS_Store$']
  let g:NERDTreeDirArrowExpandable='▸'
  let g:NERDTreeDirArrowCollapsible='▾'

" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on
