set hidden
set nocompatible
syn on
syntax sync minlines=256
set nu
set cin
set autoindent
set ts=8 sw=8 sts=0
set ttyfast
set lazyredraw "no redraw nelle macro
set backspace=indent,eol,start
"set whichwrap+=<,>,[,]
set encoding=utf-8
set ffs=unix,dos,mac
set autoread " autorileva modifiche
"set scrolloff=8 " linee visibili dopo scroll
set nobackup
set noundofile
set noswf
set hlsearch " evidenzia tutti i match
set incsearch "ricerca durante digitazione
set autochdir "cambio dir automatico
"set cursorline "evidenzia riga attuale
"set modeline "per modeline su prima riga
set linebreak "non wrappa in mezzo alle parole
set wildmenu
set listchars=tab:――▶,eol:▽,trail:●,nbsp:○
"set laststatus=2
set tm=300
set showbreak=⇒
set relativenumber
"----------------------------------------------------------------------
"let g:python_recommended_style = 0
"let g:polyglot_disabled = ['sensible', 'autoindent']
"----------------------------------------------------------------------
call plug#begin('~/.vim/autoload/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/NERDTree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
"Plug 'gryf/wombat256grf'
"Plug 'arcticicestudio/nord-vim'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()
"----------------------------------------------------------------------
" Airline
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
let g:airline#extensions#tabline#enabled = 1
" Nerdtree
nnoremap ` :NERDTreeToggle<cr>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
"----------------------------------------------------------------------
let mapleader = "\<Space>"
nnoremap Y y$
nnoremap <leader>l :set list!<cr>
nnoremap <leader>w :set wrap!<cr>
nnoremap <leader>m :marks<cr>
nnoremap <leader>d :bd<CR>
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>
nnoremap <F1> :set nu!<cr>
nnoremap <F2> :set relativenumber!<cr>
nnoremap <F3> :set spell!<cr>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
inoremap jk <Esc>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap <leader>j :cn<CR>zz
nnoremap <leader>k :cp<CR>zz
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gf :diffget //3<CR>
nnoremap <leader>gj :diffget //2<CR>
"----------------------------------------------------------------------
function! X11Copy()
  normal! gvy
  call system('xsel -ib', @0)
endfunction
function! X11Paste()
  let @" = system('xsel -ob')
  normal! p
endfunction
function! X11Replace()
  let @" = system('xsel -ob')
  normal! gvp
endfunction
vnoremap <leader>y :call X11Copy()<CR>
nnoremap <leader>p :call X11Paste()<CR>
vnoremap <leader>p :call X11Replace()<CR>
"----------------------------------------------------------------------
"set mouse=a
if has("termguicolors")
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
endif

set bg=dark
"colorscheme tokyonight
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_cursor = 'orange'
let g:gruvbox_material_ui_contrast = 'high'
let g:gruvbox_material_palette = 'original'
colorscheme gruvbox-material

hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=#FF0000
