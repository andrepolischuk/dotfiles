" General
set nocompatible
set nobackup
set noswapfile
set viminfo^=%

" Formatting
set nowrap
set backspace=2
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
set listchars=tab:➛·,trail:·,space:·,nbsp:·,eol:¬,extends:⇢,precedes:⇠

" UI
set number
set cul
set nostartofline
set noshowcmd
set noshowmode
set noruler
set tildeop
set title
set clipboard+=unnamed
set scrolloff=10
set autoread

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

" Reload buf when focusing vim
autocmd FocusGained,BufEnter * :silent! !

" Encoding
set encoding=utf-8 nobomb
set fileencoding=utf-8

" Search
set hlsearch
set incsearch
set ignorecase

" Shortcuts for moving between tabs
map <S-Left> gT
map <S-Right> gt

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" General plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'rakr/vim-one'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'gregsexton/MatchTag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'terryma/vim-multiple-cursors'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
  set laststatus=2
  let g:airline_theme = 'one'
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 0

" Search
Plugin 'rking/ag.vim'
  let g:ag_highlight = 1
Plugin 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_open_new_file = 't'
  let g:ctrlp_match_window = 'order:ttb,max:20,results:20'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Languages
Plugin 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'mxw/vim-jsx'
  let g:jsx_ext_required = 0
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled = 1
Plugin 'groenewege/vim-less'
Plugin 'ap/vim-css-color'
Plugin 'stephenway/postcss.vim'

" Filetypes
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.soy set filetype=html

" Vundle end
call vundle#end()

" Syntax
filetype plugin indent on
syntax enable

" Use true colors
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Color scheme
set background=light
colorscheme one

" Override colors
hi Normal guibg=NONE ctermbg=NONE
hi CursorLine guibg=#eeeeee ctermbg=255 cterm=NONE
hi CursorLineNR guibg=#eeeeee ctermbg=255
hi LineNr guifg=#c6c6c6 ctermfg=251 ctermbg=NONE
