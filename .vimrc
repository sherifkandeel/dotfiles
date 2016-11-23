"--------------------------------------------
"PATHOGEN AND BUNDLES-----------------------
"--------------------------------------------
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

call pathogen#infect()

"--------------------------------------------
"STARTERS------------------------------------
"--------------------------------------------
set nocompatible

" shares the clipboard with system clipboard if  running in terminal
if !has('gui_running')
    set clipboard=unnamed
endif

"for faster vim
" set ttyfast
" set lazyredraw
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

"set tab sizes for different file types: 
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2  expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab

"Auto reload files when changed.
set autoread

"Switch between buffers without saving
set hidden

"opening any new tab to the right
set splitright

"set word autocomplete
set complete+=kspell

"maintaining scale after closing a buffer (no window resize, all space of closed one goes to the left pane)
" set noea

"--------------------------------------------
"SEARCHING-----------------------------------
"--------------------------------------------
"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase



"--------------------------------------------
"RULER STUFF---------------------------------
"--------------------------------------------
"Display current cursor position in lower right corner.
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) 

"Better line wrapping 
set nowrap
set textwidth=120
set formatoptions=qrn1



"--------------------------------------------
"NUMBERS-------------------------------------
"--------------------------------------------
"set line numbers
set number

"Settings relative numbering in line numbers
" set relativenumber


"--------------------------------------------
"EDITING-------------------------------------
"--------------------------------------------
" Allow the cursor to go in to 'invalid' places
set virtualedit=all

"setting paste toggle to turn off autoindent when pasting
set pastetoggle=<F12>


"--------------------------------------------
"CONCEALING----------------------------------
"--------------------------------------------
setlocal concealcursor=cnv "will only show true character in insert mode.
setlocal conceallevel=2
syntax match scalaArrow "⇒" conceal cchar=→     



"--------------------------------------------
"MAPPINGS------------------------------------
"--------------------------------------------
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

" toggle linenumbers
noremap <silent> <leader>; :set invnumber<CR>

"map to disable highlight
nnoremap <silent> <leader><Space> :noh<return>

" ; switches to command mode
nnoremap ; :

" Make Y behave like other capitals
nnoremap Y y$

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Use arrow keys to change buffers
noremap <left> :bp<CR>
noremap <right> :bn<CR>

"Run flake for the current file shortcut
noremap fl :call Flake8() <CR>

"--------------------------------------------
"NAVIGATION----------------------------------
"--------------------------------------------
"splits horizontally and opens the last buffer inside the buttom window
nnoremap <leader>sj :execute "rightbelow split " . bufname("#")<CR>
"splits horizontally and opens the last buffer inside the upper window
nnoremap <leader>sk :execute "leftabove split " . bufname("#")<CR>
"splits vertically and opens the last buffer inside the right window
nnoremap <leader>sl :execute "rightbelow vsplit " . bufname("#")<CR>
"splits vertically and opens the last buffer inside the left window
nnoremap <leader>sh :execute "leftabove vsplit " . bufname("#")<CR>

" move lines up or down
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
inoremap <C-j> <Esc>:m .+1<CR>gi
inoremap <C-k> <Esc>:m .-2<CR>gi
vnoremap <C-j> :m '>+1<CR>gv
vnoremap <C-k> :m '<-2<CR>gv


"--------------------------------------------
"COLORSCHEME SETTINGS------------------------
"--------------------------------------------
" colorscheme SlateDark
colorscheme vorange

" colorscheme gruvbox
" set bg=dark
" let g:gruvbox_contrast_dark = 'hard'


"--------------------------------------------
"PLUGIN CONFIGURATIONS-----------------------
"--------------------------------------------

"TMUX/VIM navigator plugin
"https://github.com/christoomey/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <leader>h :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>j :TmuxNavigateDown<cr>
nnoremap <silent> <leader>k :TmuxNavigateUp<cr>
nnoremap <silent> <leader>l :TmuxNavigateRight<cr>


"NERDTree configuration
"----------------------
"hide files with extensions pyc from the nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" let NERDTreeShowHidden=1

" set guifont=Meslo\ LG\ M\ DZ\ for\ powerline:h12
" set guifont=FuraMonoForPowerline\ Nerd\ Font:h12
set guifont=Fira\ Mono\ Medium\ for\ powerline:h12

"Airline configuration
"---------------------
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1
set laststatus=2

                   
"git-gutter settings
"-------------------
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


"--------------------------------------------
"COLORCOLUMN---------------------------------
"--------------------------------------------
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Grey


"--------------------------------------------
"FUNCTIONS-----------------------------------
"--------------------------------------------

"Paste from tmux automatically turns on paste mode
"-------------------------------------------------
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"Window swapping function
"------------------------
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

"window resizing
"---------------
" Shift-like window resizing
function! IsEdgeWindowSelected(direction)
    let l:curwindow = winnr()
    exec "wincmd ".a:direction
    let l:result = l:curwindow == winnr()

    if (!l:result)
        " Go back to the previous window
        exec l:curwindow."wincmd w"
    endif

    return l:result
endfunction

function! GetAction(direction)
    let l:keys = ['h', 'j', 'k', 'l']
    let l:actions = ['vertical resize -', 'resize +', 'resize -', 'vertical resize +']
    return get(l:actions, index(l:keys, a:direction))
endfunction

function! GetOpposite(direction)
    let l:keys = ['h', 'j', 'k', 'l']
    let l:opposites = ['l', 'k', 'j', 'h']
    return get(l:opposites, index(l:keys, a:direction))
endfunction

function! ShiftResize(direction, amount)
    " v >
    if (a:direction == 'j' || a:direction == 'l')
        if IsEdgeWindowSelected(a:direction)
            let l:opposite = GetOpposite(a:direction)
            let l:curwindow = winnr()
            exec 'wincmd '.l:opposite
            let l:action = GetAction(a:direction)
            exec l:action.a:amount
            exec l:curwindow.'wincmd w'
            return
        endif
    " < ^
    elseif (a:direction == 'h' || a:direction == 'k')
        let l:opposite = GetOpposite(a:direction)
        if IsEdgeWindowSelected(l:opposite)
            let l:curwindow = winnr()
            exec 'wincmd '.a:direction
            let l:action = GetAction(a:direction)
            exec l:action.a:amount
            exec l:curwindow.'wincmd w'
            return
        endif
    endif

    let l:action = GetAction(a:direction)
    exec l:action.a:amount
endfunction

" Map to Ctrl+hjkl to resize panes
nnoremap <S-h> :call ShiftResize('h', 1)<CR>
nnoremap <S-j> :call ShiftResize('j', 1)<CR>
nnoremap <S-k> :call ShiftResize('k', 1)<CR>
nnoremap <S-l> :call ShiftResize('l', 1)<CR>

" Toggle colorcolumn
" ------------------
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=+1
  endif
endfunction

" Map ,cc to toggle color column
nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<CR>

"--------------------------------------------
"AUTO COMMANDS-------------------------------
"--------------------------------------------
" disable paste mode when leaving Insert Mode
au InsertLeave * set nopaste

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

" automatically turn on spell check in *.md files
autocmd BufRead,BufNewFile *.md setlocal spell


