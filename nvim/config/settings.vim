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
