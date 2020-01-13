" General
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set viminfo^=%

" Interface
set hidden
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
set hlsearch
set incsearch
set ignorecase
set autoread
autocmd FocusGained,BufEnter * :silent! !
set colorcolumn=81
autocmd FileType gitcommit set colorcolumn=51,73

" Formatting
set nowrap
autocmd FileType markdown setlocal wrap
autocmd FileType html setlocal wrap
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
let g:netrw_menu = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" True colors
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

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
Plug 'junegunn/goyo.vim'
  nnoremap <Space>g :Goyo<CR>
Plug 'preservim/nerdtree'
  nnoremap <Space>f :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let NERDTreeMinimalUI = 1
  let NERDTreeShowHidden = 1
  let NERDTreeIgnore = ['\.git$', '\.vim$', '\~$']
  let g:NERDTreeMapOpenSplit = "h"
  let g:NERDTreeMapOpenVSplit = "v"
  let g:NERDTreeMapOpenInTab = "t"
  let g:NERDTreeMapActivateNode = "<F4>"
  let g:NERDTreeMapPreview = "<F3>"
Plug 'Xuyuanp/nerdtree-git-plugin'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  set laststatus=2
  set ttimeoutlen=0
  let g:airline_theme = 'one'
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline#extensions#ale#enabled = 0
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#tab_min_count = 2
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 0

" Search
Plug 'rking/ag.vim'
  nnoremap <Space>s :Ag<Space>
  let g:ag_highlight = 1
  let g:ag_working_path_mode = "r"
Plug 'wsdjeg/FlyGrep.vim'
  nnoremap <Space>/ :FlyGrep<CR>
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_open_new_file = 't'
  let g:ctrlp_match_window = 'order:ttb,max:20,results:20'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Linting
Plug 'w0rp/ale'
  let g:ale_sign_error = '!'
  let g:ale_sign_warning = '?'
  let g:ale_set_highlights = 0
  let g:ale_lint_on_text_changed = 'never'
  if executable("standard")
    let g:ale_linters = {'javascript': ['standard', 'flow']}
  endif

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
Plug 'reasonml-editor/vim-reason-plus'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'kchmck/vim-coffee-script'
  let g:yats_host_keyword = 1
Plug 'jparise/vim-graphql'
Plug 'keith/swift.vim'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'amiralies/coc-flow', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Syntax colors
filetype plugin indent on
syntax enable
set background=light
colorscheme one
