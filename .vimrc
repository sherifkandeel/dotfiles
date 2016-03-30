"mkdir -p ~/.vim/autoload ~/.vim/bundle && \
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim


"Plugins, run :Helptags to generate help
"cd ~/.vim/bundle
"git clone https://github.com/scrooloose/nerdtree.git
"git clone git://github.com/tpope/vim-commentary.git
"git clone git://github.com/tpope/vim-surround.git
"git clone git://github.com/tpope/vim-repeat.git
"git clone https://github.com/nvie/vim-flake8.git
"git clone git://github.com/tpope/vim-fugitive.git
"git clone https://github.com/vim-airline/vim-airline
"git clone https://github.com/vim-airline/vim-airline-themes

"vim ~/.vimrc 
":cd ~/sre/sre-web/
call pathogen#infect()

"starters
set nocompatible

"set line numbers
set number

"for faster vim
set ttyfast
set lazyredraw
" set history=1000
" set ttyscroll=2

"set colorscheme
"colorscheme slate

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
set ruler

"starts the NERDTree plugin, and directs it to the work folder.
"autocmd VimEnter * NERDTree 

"sets spell correction 
"set spell

"Better line wrapping 
set nowrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Switch between buffers without saving
set hidden

"setting tab to 4 spaces:
set tabstop =4 
set shiftwidth =4 
set expandtab

"mapping the command to run the python file we're editing
nmap ,dt :!python %<CR>

"opening any new tab to the right
set splitright

"setting paste toggle to turn off autoindent when pasting
set pastetoggle=<F12>

"hide files with extensions pyc from the nerdtree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

"map the window movements: 
noremap <silent> el <C-W>l
noremap <silent> ek <C-W>k
noremap <silent> eh <C-W>h
noremap <silent> ej <C-W>j

"open NERDTREE
noremap nt :NERDTree <CR>

"mapping the relativenumber
nmap rn :set relativenumber <CR>
nmap nrn :set norelativenumber <CR>
set relativenumber

"color scheme settings
" color molokai
colorscheme SlateDark
" colorscheme Tomorrow-Night
" colorscheme kalisi
" colorscheme apprentice
" color python

noremap fl :call Flake8() <CR>
"Flake8 settings
"autocmd BufWritePost *.py call Flake8()

"Airline configuration
set guifont=Liberation\ Mono\ for\ powerline
let g:airline_powerline_fonts = 1
set laststatus=2


" Powerline-status
" run-shell "powerline-daemon -q"
" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
