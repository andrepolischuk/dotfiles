set nocompatible
set nobackup
set noswapfile
set nowrap
set number
set nostartofline
set noshowcmd
set noshowmode
set noruler
set tildeop
set title
set clipboard+=unnamed
set scrolloff=10
set backspace=2
set cul
set autoread

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
cnoreabbrev W w
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
set copyindent
set preserveindent
set nosmartindent
set nocindent
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
Plugin 'airblade/vim-gitgutter'
Plugin 'tomtom/tcomment_vim'
Plugin 'a/seoul256.vim'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
  set laststatus=2
  let g:airline_theme = 'solarized'
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#fnamemod = ':t'

" Search
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_match_window = 'order:ttb,max:15,results:15'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Languages
Plugin 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0
Plugin 'groenewege/vim-less'
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = 'underscore,react,flux,ramda'
Plugin 'mxw/vim-jsx'
  let g:jsx_ext_required = 0
Plugin 'gavocanov/vim-js-indent'
Plugin 'othree/es.next.syntax.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled = 1
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'JulesWang/css.vim'
Plugin 'stephenway/postcss.vim'
Plugin 'jiangmiao/auto-pairs'

" Filetypes
au BufRead,BufNewFile *.es6 set filetype=javascript

" Vundle end
call vundle#end()

" Syntax
filetype plugin indent on
syntax enable

" Color scheme
set background=light
colorscheme seoul256-light

" Override colors
hi Normal ctermbg=none
hi CursorLine ctermbg=255
hi CursorLineNR ctermbg=255
hi LineNr ctermfg=251 ctermbg=none
hi VertSplit ctermfg=251 ctermbg=none
hi NonText ctermfg=251
hi Comment ctermfg=247
hi Todo ctermbg=none
