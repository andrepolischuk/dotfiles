" General
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set viminfo^=%

" Interface
set hidden
set number
set laststatus=0
set signcolumn=yes
" set scl=yes
set cul
set nostartofline
set noshowcmd
set showmode
set noruler
set tildeop
set title
set clipboard+=unnamed
set scrolloff=999
set hlsearch
set incsearch
set ignorecase
set autoread
autocmd FocusGained,BufEnter * :silent! !
set colorcolumn=0
" set colorcolumn=81
" autocmd FileType gitcommit set colorcolumn=51,73
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Tabline
set showtabline=1
set tabline=%!TabLine()
function! TabLine()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnr = tabpagebuflist(i)[0]
    let tabname = fnamemodify(bufname(bufnr), ':t')
    let modified = getbufvar(bufnr, '&modified') ? '+' : ''
    if i == tabpagenr()
      let s .= '%#TabLineSel#' . ' ' . tabname . modified . ' '
    else
      let s .= '%#TabLine#' . ' ' . tabname . modified . ' '
    endif
  endfor
  let s .= '%#TabLineFill#' . ' '
  return s
endfunction

" Formatting
set nowrap
autocmd FileType markdown setlocal wrap linebreak breakindent
autocmd FileType html setlocal wrap linebreak breakindent
autocmd FileType text setlocal wrap linebreak breakindent
set backspace=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set autoindent
set copyindent
set preserveindent
set nosmartindent
set nocindent
set list
set listchars=tab:——,trail:·,space:·,nbsp:·,eol:¬,extends:⇢,precedes:⇠
set encoding=utf-8 nobomb
set fileencoding=utf-8

" Moving
noremap j gj
noremap k gk

" Files
autocmd FileType netrw setlocal bufhidden=delete
let loaded_netrwPlugin = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" True colors
" if (empty($TMUX))
"   if (has("nvim"))
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif

" Plugins
call plug#begin('~/.vim/plugged')

" General
Plug 'rakr/vim-one'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'matze/vim-move'
  let g:move_key_modifier = 'C'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdtree'
  nnoremap <Space>f :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let NERDTreeMinimalUI = 1
  let NERDTreeShowHidden = 1
  let NERDTreeSortHiddenFirst = 1
  let NERDTreeIgnore = ['\.git$', '\.vim$', '\~$']
  let g:NERDTreeHijackNetrw = 0
  let g:NERDTreeMapOpenSplit = "h"
  let g:NERDTreeMapOpenVSplit = "v"
  let g:NERDTreeMapOpenInTab = "t"
  let g:NERDTreeMapPreview = "p"
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jamessan/vim-gnupg'
Plug 'powerman/vim-plugin-ruscmd'

" Search
Plug 'vim-scripts/grep.vim'
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_open_new_file = 't'
  let g:ctrlp_match_window = 'order:ttb,max:20,results:20'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Linting
Plug 'w0rp/ale'
  nnoremap ]r :ALENextWrap<CR>
  nnoremap [r :ALEPreviousWrap<CR>
  let g:ale_sign_error = '!'
  let g:ale_sign_warning = '?'
  let g:ale_set_highlights = 0
  let g:ale_lint_on_text_changed = 'never'

" Languages
Plug 'elzr/vim-json'
  let g:vim_json_syntax_conceal = 0
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
  let g:jsx_ext_required = 0
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'rhysd/vim-gfm-syntax'
  let g:markdown_fenced_languages = ['sh', 'html', 'css', 'json', 'yaml', 'js=javascript']
Plug 'jxnblk/vim-mdx-js'
Plug 'othree/html5.vim'
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'
Plug 'stephenway/postcss.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jparise/vim-graphql'
Plug 'alampros/vim-styled-jsx'
Plug 'bfrg/vim-c-cpp-modern'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'clangd/coc-clangd', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>showDocumentation()<CR>

function! s:showDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Syntax colors
filetype plugin indent on
syntax enable
colorscheme one
set background=light

" Normalize colors
highlight Normal guibg=NONE ctermbg=NONE guifg=#494b53 ctermfg=239
highlight SignColumn guibg=NONE ctermbg=NONE
highlight CursorLine guibg=#f0f0f0 ctermbg=255
highlight CursorLineNr guibg=#f0f0f0 ctermbg=255 guifg=#494b53 ctermfg=239
highlight TabLine guibg=NONE ctermbg=NONE guifg=#abb2bf ctermfg=145
highlight TabLineFill guibg=NONE ctermbg=NONE
highlight TabLineSel guibg=#e0e0e0 ctermbg=254 guifg=#494b53 ctermfg=239
highlight StatusLine guifg=#494b53 ctermfg=239
highlight StatusLineNC guibg=#494b53 ctermbg=239 guifg=#e0e0e0 ctermfg=254
highlight ModeMsg guifg=#494b53 ctermfg=239
highlight NERDTreeFile guifg=#494b53 ctermfg=239
