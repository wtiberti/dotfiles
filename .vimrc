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
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gryf/wombat256grf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
# Keyboard - italian
nnoremap \ :NERDTreeToggle<cr>
nnoremap ç :
vnoremap ç :
#----------------------------------------------------------------------
def g:X11Copy(): string
	normal! gvy
	call system('/usr/bin/xsel -b', @0)
	return @0
enddef
def g:X11Paste(): string
	@" = system('/usr/bin/xsel -bo')
	normal! p
	return @"
enddef
def g:X11Replace(): string
	@" = system('/usr/bin/xsel -bo')
	normal! gvp
	return @"
enddef
defcompile

vnoremap <leader>y :w !xsel -b<CR><CR>
nnoremap <leader>p :r !xsel -bo<CR>
vnoremap <leader>p :call X11Replace()<CR>

if has("termguicolors")
	set t_8f=[38;2;%lu;%lu;%lum
	set t_8b=[48;2;%lu;%lu;%lum
	set termguicolors
endif

set bg=dark

if has("gui_running")
	set columns=110
	set lines=40
	set guioptions=acv
	set guifont=Hack\ 11
else
	hi Normal guibg=NONE ctermbg=NONE
	hi EndOfBuffer guibg=NONE ctermbg=NONE guifg=#FF0000
endif
