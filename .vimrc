"
" pathogen and bundles--------------------------------
"
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
"git clone git://github.com/airblade/vim-gitgutter.git

"vim ~/.vimrc 
":cd ~/sre/sre-web/
call pathogen#infect()

"
"starters---------------------------------------------
"
set nocompatible

" shares the clipboard with system clipboard
" set clipboard=unnamed

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

"Switch between buffers without saving
set hidden

"opening any new tab to the right
set splitright

"
"Searching--------------------------------------------
"
"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"
"Ruler stuff------------------------------------------
"
"Display current cursor position in lower right corner.
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) 

"Better line wrapping 
set nowrap
set textwidth=120
set formatoptions=qrn1

"
"Numbers----------------------------------------------
"
"set line numbers
set number

"Settings relative numbering in line numbers
set relativenumber

"settings a vertical column for 120 Characters
set cc=120

"
"Editing----------------------------------------------
"
" Allow the cursor to go in to 'invalid' places
set virtualedit=all

"setting paste toggle to turn off autoindent when pasting
set pastetoggle=<F12>

"
"Mappings---------------------------------------------
"
let mapleader = ','

"exit insert mode with jk
inoremap jk <esc>

"map the window movements: 
noremap <silent> el <C-W>l
noremap <silent> ek <C-W>k
noremap <silent> eh <C-W>h
noremap <silent> ej <C-W>j
"Also map them to ,hjkl
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>

"mapping the relativenumber
nmap rn :set relativenumber <CR>
nmap nrn :set norelativenumber <CR>

" ; switches to command mode
nnoremap ; :

"
" splits ---------------------------------------------
" 
"splits horizontally and opens the last buffer inside the buttom window
nnoremap <leader>sj :execute "rightbelow split " . bufname("#")<CR>
"splits horizontally and opens the last buffer inside the upper window
nnoremap <leader>sk :execute "leftabove split " . bufname("#")<CR>
"splits vertically and opens the last buffer inside the right window
nnoremap <leader>sl :execute "rightbelow vsplit " . bufname("#")<CR>
"splits vertically and opens the last buffer inside the left window
nnoremap <leader>sh :execute "leftabove vsplit " . bufname("#")<CR>

" move lines up or down ------------------------------
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
inoremap <C-j> <Esc>:m .+1<CR>gi
inoremap <C-k> <Esc>:m .-2<CR>gi
vnoremap <C-j> :m '>+1<CR>gv
vnoremap <C-k> :m '<-2<CR>gv

"Run flake for the current file shortcut
noremap fl :call Flake8() <CR>

"
"colorscheme settings---------------------------------
"
colorscheme SlateDark

"
"Plugin configurations--------------------------------
"
"NERDTree stuff---------------------------------------
"hide files with extensions pyc from the nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

"open NERDTREE
" noremap nt :NERDTree <CR>


"Airline configuration--------------------------------
" set guifont=Liberation\ Mono\ for\ powerline:h12
set guifont=Fira\ Mono\ Medium\ for\ Powerline:h12
let g:airline_powerline_fonts = 1
set laststatus=2

" Powerline-status
" run-shell "powerline-daemon -q"
" set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

                   
"
"git-gutter settings
"
"update time (in ms)
set updatetime=250
"dont let gitgutter map keys
let g:gitgutter_map_keys = 0
"always leave sign column
let g:gitgutter_sign_column_always = 1
"max signs (for perofrmance)
let g:gitgutter_max_signs = 500
highlight GitGutterAddLine ctermbg=green
highlight GitGutterDeleteLine ctermbg=red
"Mapping toggle commands
noremap <leader>gg :GitGutterToggle<CR>
noremap <leader>ggs :GitGutterSignsToggle<CR>
noremap <leader>ghl :GitGutterLineHighlightsToggle<CR>
"setting gitgutter not to run by default
let g:gitgutter_enabled = 0
"change sign for modified
let g:gitgutter_sign_modified = '~'



"
"functions--------------------------------------------
"
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
