"
" basic single file config
"


"
" General settings
"

let mapleader=","
noremap \ ,

" Stop Vim dying if there's massively long lines.
set synmaxcol=128

set lazyredraw

" filetype configs
filetype plugin indent on
runtime macros/matchit.vim

" keep cursor centered on the screen, 5 lines above and below when possible
set scrolloff=5

" faster redraw
set ttyfast

" show tabs and trailing spaces
set list listchars=tab:»·,trail:·

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" check if file was changed outside of vim
set autoread

" break long lines visually
set breakindent
set linebreak

" fix slight delay after pressing ESC then O http://ksjoberg.com/vim-esckeys.html
set timeout timeoutlen=500 ttimeoutlen=100


set history=10000

" convert tabs to 2 spaces, indent 2 spaces as well
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

" when searching with lower case only, ignore case
set ignorecase smartcase

" set spell check to english uk
set spelllang=en_gb
syntax spell toplevel

" highlight matches on search
set incsearch
set hlsearch

" No backup and swap files
set nobackup
set nowritebackup
set noswapfile
" Undo changes, even when file was closed
if !&diff
  set undodir=~/.vim/undodir
  set undofile
endif

" make backspace behave normal
set backspace=indent,eol,start

" command line completions
set wildmenu
set wildmode=full

" disable fold, I don't use and is very slow
set foldmethod=manual

" line numbers configs
set number

" placement of the new pane
set splitbelow
set splitright

" http://robots.thoughtbot.com/faster-grepping-in-vim/
set grepprg=ag\ --nogroup\ --nocolor

" enable paste toggle, to keep original formatting
set pastetoggle=<F10>

"
" Keymaps
"

" clear highlights by hitting ctrl /
nnoremap \ :noh<CR>

" Save file using sudo, if we don't have permissions
cnoremap w!! w !sudo tee %

" open terminal mode vertical split with 10 lines
nnoremap <Leader>t :10split +te<CR>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle spellcheck
map <Leader>sc :setlocal spell!<CR>

" when pasting, set paste mode first, then paste, then set paste mode off
inoremap <C-v> <F10><C-r>+<F10>

" shortcut split vertically
map <Leader>v :vsplit<CR>

" clean up any trailing whitespace
nnoremap <Leader>w :%s/\s\+$//<cr>:let @/=''<cr>

" stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Move to the beginning/end of the line with H and L
noremap H ^
noremap L $

" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
" useful for visual line breaks, done by vim
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" make copy/paste from system clip easier
vnoremap <Leader>8 "*y
vnoremap <Leader>9 "*p
nnoremap <Leader>8 "*p

" Edit my init.vim and source my edit.vim
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>



"
" COMMANDS
"

" map uppercase and mixed case
:command! W w
:command! WA wa
:command! Wa wa
:command! WQ wq
:command! Wq wq
:command! Q q
:command! QA qa
:command! Qa qa
:command! Up up
:command! UP up

:command! RefreshSyntax syntax sync fromstart

