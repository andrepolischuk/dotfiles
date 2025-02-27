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
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'powerman/vim-plugin-ruscmd'

" Search
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_open_new_file = 't'
  let g:ctrlp_match_window = 'order:ttb,max:20,results:20'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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
Plug 'ap/vim-css-color'
Plug 'stephenway/postcss.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'bfrg/vim-c-cpp-modern'

" IDE
Plug 'w0rp/ale'
  nnoremap ]r :ALENextWrap<CR>
  nnoremap [r :ALEPreviousWrap<CR>
  let g:ale_sign_error = '!'
  let g:ale_sign_warning = '?'
  let g:ale_set_highlights = 0
  let g:ale_lint_on_text_changed = 'never'
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

" Documentation in preview window
nnoremap K :call <SID>ShowDocumentation()<CR>
function! s:ShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Search
command! -nargs=+ Grep call s:Grep(<f-args>)
nnoremap ? :Grep<Space>
nnoremap \\ :Grep //<CR>
function! s:Grep(pattern, files = '')
  if empty(a:files)
    let is_git = system('git rev-parse --is-inside-work-tree 2>/dev/null')
    if is_git =~ 'true'
      let files = '`git ls-files -co --exclude-standard`'
    else
      let files = '*'
    endif
  else
    let files = a:files
  endif
  cexpr []
  silent! execute 'vimgrep ' . a:pattern . ' ' . files
  if !empty(getqflist())
    copen
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
