"###############################################################################
"# File Name	: 	init.vim
"# Author 	:	Masroor Rasheed
"# Created	:	Sat 18 Apr 2020 21:10:18 BST
"###############################################################################

" Global Varaibles
let vim_plug_just_installed = 0		" Initiate Setup for first time

" Mode Settings for Cursor
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical block
let &t_SI.="\e[5 q" 	"SI = INSERT mode
let &t_SR.="\e[3 q"	"SR = REPLACE mode
let &t_EI.="\e[1 q"	"EI = NORMAL mode

set nocompatible		" No Backward compatibility

" Install Plug manager if not installed
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path) 
	echo "Installing Vim-plug..."
	silent !mkdir -p ~/.config/nvim/autoload
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let vim_plug_just_installed = 1
endif
" Load Vim-Plug if just installed
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Plug Management 
" ============================================================================
call plug#begin("~/.config/nvim/plugged")

Plug 'vim-airline/vim-airline'				" Status bar Customization
Plug 'vim-airline/vim-airline-themes'		" Themes for Status bar
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy Finder 

call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif
" ============================================================================

" Syntax highlighting
filetype plugin indent on	
" General Set up
set path+=**			" Search current directory recursively
set wildmenu			" Display all matches
set incsearch			" Incremental search
set nobackup			" No auto backup
"set noswapfile			" No swap
set t_Co=256			" Set if term support 256 colours
syntax on			" Syntax highlighting
set mouse=nicr			" Enabling mouse scrolling
set nu rnu 			" Line numbering
set cursorline			" Highlight current line
setlocal spell spelllang=en_gb	" British Dictionary
set spell 
set clipboard=unnamedplus
set hlsearch
set smartindent
set showmatch
set incsearch
set encoding=utf-8
set laststatus=2
" Text, Tab and indent related
set smarttab
set shiftwidth=4
set tabstop=4
set colorcolumn=80

" Latex Suite Specific
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"

" Splits and Tabbed Files
"
set splitbelow splitright
" Remap slip Navigations
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusting split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
" Change 2 split windows from vertical to horizontal and vice versa
map <Leader>th	<C-w>t<C-w>H
map <Leader>tk	<C-w>t<C-w>K

" Removes pipes | that act as separators on splits
set fillchars+=vert:\

colorscheme gruvbox
" hi Comment ctermfg=LightBlue


" File type specific 
autocmd BufNewFile,BufRead *.md set filetype=markdown


