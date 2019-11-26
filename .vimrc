if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter', { 'on':  'GitGutterToggle' }
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

set nocompatible

"enable mouse
" set mouse=n
" shares the clipboard with system clipboard if  running in terminal
if !has('gui_running')
    set clipboard=unnamed
endif

" For faster vim
set ttyfast
set lazyredraw
set history=1000
set ttyscroll=2

" Set colorscheme
"colorscheme slate

" Setting undo
"
" Tell vim to use an undo file
set undofile

" Set a directory to store the undo history
set undodir="~/.vim/.vimundo/"

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

" Sensible backspace
set backspace=indent,eol,start

" Write the old file out when switching between files.
set autowrite

" Set tab key and indent command to be 4 spaces (no tab is inserted)
set tabstop=4
set shiftwidth=4
set expandtab

" set tab sizes for different file types: 
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2  expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab

" Auto reload files when changed.
set autoread

" Switch between buffers without saving
set hidden

" Opening any new tab to the right
set splitright

" Set word autocomplete
set complete+=kspell

" Maintaining scale after closing a buffer (no window resize, all space of closed one goes to the left pane)
" set noea

" Set incremental searching"
set incsearch

" Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase


" Folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2
nnoremap <space> za
vnoremap <space> zf


" Display current cursor position in lower right corner.
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) 

" Better line wrapping 
set nowrap
set textwidth=120
set formatoptions=qrn1



" Set line numbers
set number

" Set relative numbering in line numbers
" set relativenumber


" Allow the cursor to go in to 'invalid' places
set virtualedit=all

" Setting paste toggle to turn off autoindent when pasting
set pastetoggle=<F12>


" setlocal concealcursor=cnv "will only show true character in insert mode.
" setlocal conceallevel=0 "I disabled it by default
" syntax match scalaArrow "⇒" conceal cchar=→     



" Mapping
let mapleader = ','

" Map paste when in visual mode to the last yanked text not the last replaced.
vnoremap p "0p
vnoremap P "0P

" Exit insert mode with jk
inoremap jk <esc>

" Map the window movements: 
noremap <silent> el <C-W>l
noremap <silent> ek <C-W>k
noremap <silent> eh <C-W>h
noremap <silent> ej <C-W>j

" Also map them to ,hjkl
noremap <silent> <leader>h :wincmd h<CR>
noremap <silent> <leader>j :wincmd j<CR>
noremap <silent> <leader>k :wincmd k<CR>
noremap <silent> <leader>l :wincmd l<CR>

" Close buffer without closing the tab with <leader> q
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" toggle linenumbers
noremap <silent> <leader>; :set invnumber<CR>

"map to disable highlight
nnoremap <silent> <leader><Space> :noh<return>

" ; switches to command mode
nnoremap ; :

" ,p pastes in vim from clipboard
nmap <leader>p :set paste<CR>"*P:set nopaste<return>

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

" splits horizontally and opens the last buffer inside the buttom window
nnoremap <leader>sj :execute "rightbelow split " . bufname("#")<CR>
" splits horizontally and opens the last buffer inside the upper window
nnoremap <leader>sk :execute "leftabove split " . bufname("#")<CR>
" splits vertically and opens the last buffer inside the right window
nnoremap <leader>sl :execute "rightbelow vsplit " . bufname("#")<CR>
" splits vertically and opens the last buffer inside the left window
nnoremap <leader>sh :execute "leftabove vsplit " . bufname("#")<CR>

" Move lines up or down
nnoremap <C-j> :m .+1<CR>
nnoremap <C-k> :m .-2<CR>
inoremap <C-j> <Esc>:m .+1<CR>gi
inoremap <C-k> <Esc>:m .-2<CR>gi
vnoremap <C-j> :m '>+1<CR>gv
vnoremap <C-k> :m '<-2<CR>gv


" colorscheme vorange


" Tmux/vim navigator plugin
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <leader>h :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>j :TmuxNavigateDown<cr>
nnoremap <silent> <leader>k :TmuxNavigateUp<cr>
nnoremap <silent> <leader>l :TmuxNavigateRight<cr>


" NERDTree configuration
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" let NERDTreeShowHidden=1

                   
" git-gutter settings
" update time (in ms)
set updatetime=250

"dont let gitgutter map keys
let g:gitgutter_map_keys = 0

"always leave sign column
set signcolumn=yes

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


highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Grey


" Paste from shell/tmux automatically turns on paste mode
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


" Window swapping function
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
nmap <silent> <leader>sw :call DoWindowSwap()<CR>

" Window resizing
"
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
function! g:ToggleColorColumn()
  if &colorcolumn != ''
    setlocal colorcolumn&
  else
    setlocal colorcolumn=+1
  endif
endfunction

" Map ,cc to toggle color column
nnoremap <silent> <leader>cc :call g:ToggleColorColumn()<CR>

" Disable paste mode when leaving Insert Mode
au InsertLeave * set nopaste

" Automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Automatically create views for files to save cursor positions and foldings
" au BufWinLeave ?* mkview
" au BufWinEnter ?* silent loadview

" Automatically turn on spell check in *.md files
autocmd BufRead,BufNewFile *.md setlocal spell


" Merges tab into the previous tab in a vertical split
function! MergeTab()   
    let this_tab = bufname('%') | exe 'normal! gt' | exe 'vsplit ' . this_tab | exe "normal! gT"| q | unlet this_tab
endfunction

nnoremap <leader>mm :call MergeTab()<CR>
nnoremap <leader>w :wincmd T<CR>
nnoremap <leader>t :tabn<CR>
