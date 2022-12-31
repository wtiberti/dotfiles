set hidden
set nocompatible
syn on
syntax sync minlines=256
set nu
set relativenumber
set cin
set autoindent
set ts=8 sw=8
set nowrap
set ttyfast
set lazyredraw
set backspace=indent,eol,start
"set whichwrap+=<,>,[,]
set encoding=utf-8
set ffs=unix,dos,mac
set autoread
set scrolloff=8
set nobackup
set noundofile
set noswf
set nohlsearch
set incsearch
set autochdir
set linebreak
set wildmenu
set wildoptions=pum
set listchars=tab:――▶,eol:▽,trail:●,nbsp:○
set tm=200
set showbreak=⇒
set noshowmode
"----------------------------------------------------------------------
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'scrooloose/NERDTree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gruvbox-community/gruvbox'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'srcery-colors/srcery-vim'
call plug#end()
"----------------------------------------------------------------------
set guicursor=n-v-c-i:block
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ 'cpp': ['clangd'],
\ 'c': ['clangd'],
\ }
"let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_useVirtualText = 'No'
nnoremap <F5> <Plug>(lcn-menu)
nnoremap <silent>K <Plug>(lcn-hover)
nnoremap <silent>gd <Plug>(lcn-definition)
"----------------------------------------------------------------------
let airline_powerline_fonts = 1
let airline_detect_modified = 1
let airline#extensions#tabline#enabled = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"----------------------------------------------------------------------
let mapleader = "\<Space>"
inoremap jk <Esc>
nnoremap Y y$
nnoremap <leader>l :set list!<cr>
nnoremap <leader>w :set wrap!<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>f :Files .<CR>
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>
nnoremap <leader>d :bd<CR>
nnoremap <F1> :set nu!<cr>
nnoremap <F2> :set relativenumber!<cr>
nnoremap <F3> :set spell!<cr>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <leader>j :cn<CR>zz
nnoremap <leader>k :cp<CR>zz
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gf :diffget //3<CR>
nnoremap <leader>gj :diffget //2<CR>
nnoremap ` :NERDTreeToggle<cr>
"----------------------------------------------------------------------

if has("termguicolors")
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
endif

set bg=dark
"colorscheme srcery
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=#FF0000
