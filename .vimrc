vim9script
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
#set whichwrap+=<,>,[,]
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
#----------------------------------------------------------------------
plug#begin('~/.vim/autoload/plugged')
Plug 'scrooloose/NERDTree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gryf/wombat256grf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
plug#end()
#----------------------------------------------------------------------
g:airline_powerline_fonts = 1
g:airline_detect_modified = 1
g:airline#extensions#tabline#enabled = 1
g:NERDTreeQuitOnOpen = 1
g:NERDTreeMinimalUI = 1
g:NERDTreeDirArrows = 1
#----------------------------------------------------------------------
g:mapleader = "\<Space>"
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
#----------------------------------------------------------------------
def g:X11Copy(): string
  normal! gvy
  call system('xsel -ib', @0)
  return @0
enddef
def g:X11Paste(): string
  @" = system('xsel -ob')
  normal! p
  return @"
enddef
def g:X11Replace(): string
  @" = system('xsel -ob')
  normal! gvp
  return @"
enddef
defcompile

vnoremap <leader>y :call X11Copy()<CR>
nnoremap <leader>p :call X11Paste()<CR>
vnoremap <leader>p :call X11Replace()<CR>

if has("termguicolors")
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
endif

set bg=dark
#colorscheme wombat256grf
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=#FF0000
