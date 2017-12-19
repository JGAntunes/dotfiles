call plug#begin('~/.local/share/nvim/plugged')

" Syntax
Plug 'tpope/vim-git'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi/'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'docunext/closetag.vim'

Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'neomake/neomake'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install --global tern' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install --global tern' }

" Fish shell syntax
Plug 'dag/vim-fish'

" CSS and SCSS
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
Plug 'ap/vim-css-color'
Plug 'styled-components/vim-styled-components'

" Actual Plugs
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'Valloric/MatchTagAlways'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'editorconfig/editorconfig-vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'honza/vim-snippets'
Plug 'jaawerth/nrun.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jordwalke/VimAutoMakeDirectory'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rizzatti/dash.vim'
Plug 'thinca/vim-localrc'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'prettier/vim-prettier', {
  \ 'do': 'nmp install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" Colours
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


set nocompatible
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11
let g:airline_powerline_fonts = 1
filetype plugin indent on

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
autocmd FileType typescript UltiSnipsAddFiletypes typescript-angular
autocmd CompleteDone * pclose
let g:ultisnips_javascript = {
  \ 'keyword-spacing': 'always',
  \ 'semi': 'never',
  \ 'space-before-function-paren': 'always',
  \ }

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Match tags, add javascript
let g:mta_filetypes = {
  \ 'javascript': 1,
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1
\}


" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync
let g:prettier#config#bracket_spacing = 'true'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" neomake
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd Filetype javascript let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
autocmd! BufWritePost *.js Neomake
nnoremap <leader><leader>b :ll<CR>         " go to current error/warning
nnoremap <leader><leader>m :lnext<CR>      " next error/warning
nnoremap <leader><leader>n :lprev<CR>      " previous error/warning

" Emmet remap
let g:user_emmet_leader_key='<C-Z>'

" Allow JSX in normal JS files
let g:jsx_ext_required = 0
let g:deoplete#enable_at_startup = 1
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

runtime macros/matchit.vim

" wrap quickfix window
autocmd FileType qf setlocal wrap linebreak

autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
" status bar
set statusline=%F%m%r%h%w\  "fullpath and status modified sign
set statusline+=\ %y "filetype
set statusline+=\ %{fugitive#statusline()}

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

set autoread

set breakindent

" fix slight delay after pressing ESC then O http://ksjoberg.com/vim-esckeys.html
set timeout timeoutlen=500 ttimeoutlen=100


set history=10000

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set ignorecase smartcase

set spelllang=en_gb
syntax spell toplevel

autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999

set laststatus=2

set linebreak

set incsearch
set hlsearch

set scrolloff=5

set nobackup
set nowritebackup
set noswapfile

set backspace=indent,eol,start

set wildmode=full
set wildmenu

set foldmethod=syntax

let mapleader=","
noremap \ ,

set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux

set number
set relativenumber

augroup linenumbers
  autocmd!
  autocmd BufEnter *    :set relativenumber
  autocmd BufLeave *    :set number norelativenumber
  autocmd WinEnter *    :set relativenumber
  autocmd WinLeave *    :set number norelativenumber
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd FocusLost *   :set number norelativenumber
  autocmd FocusGained * :set relativenumber
augroup END

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

set colorcolumn=120
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" clear highlights by hitting ESC
" or by hitting enter in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <CR> :noh<CR><CR>

set list listchars=tab:»·,trail:·

command! Q q

set splitbelow
set splitright

" set tags=./.tags;

" Stop Vim dying if there's massively long lines.
set synmaxcol=500

" https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
" has to go after all  declarations
highlight Comment cterm=italic
autocmd FileType javascript.jsx highlight xmlAttrib cterm=italic

" ~~~ MAPPINGS BELOW ~~~

"gtfo ex mode
map Q <Nop>
nnoremap <leader>t :10split +te<cr>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle spellcheck
map <leader>sc :setlocal spell!<CR>

map <leader>v :vsplit<CR>

" clean up any trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>rr :VtrSendLinesToRunner<cr>
nnoremap <leader>dr :VtrSendCtrlD<cr>
nnoremap <leader>ar :VtrAttachToPane<cr>

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" http://robots.thoughtbot.com/faster-grepping-in-vim/
set grepprg=ag\ --nogroup\ --nocolor

" stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

noremap H ^
noremap L $

" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" FZF.vim
nnoremap <leader>p :Files<cr>
nnoremap <leader>f :Ag<cr>
nnoremap <leader>b :Buffers<cr>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
let g:fzf_prefer_tmux = 1

" reset cursor position on files, if it's remembered
" but don't do it for gitcommit file types
autocmd BufReadPost * if &filetype != "gitcommit" && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" make copy/paste from system clip easier
vnoremap <leader>8 "*y
vnoremap <leader>9 "*p
nnoremap <leader>8 "*p

let g:javascript_plugin_flow = 1

" toggle folds with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
set foldlevel=99999

" expand all folds when entering a file
autocmd BufWinEnter * silent! :%foldopen!
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" disable the Ale HTML linters
let g:ale_linters = {
\   'html': [],
\}

" deoplete and tern configs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:deoplete#file#enable_buffer_path = '1'
"Add extra filetypes
let g:tern#filetypes = ['jsx', 'javascript.jsx']
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

" neovim terminal configs
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Edit my init.vim and source my edit.vim
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Save file using sudo, if we don't have permissions
cnoremap w!! w !sudo tee %

function! s:make_path(path)
  let bPath = expand('%:p:h')
  let fPath = substitute(system("realpath " . join(a:path)), '\n\+', '', '')
  let relPath = system("rel-path " . fPath . " " . bPath)
  " let yolo = system("perl -e 'use File::Spec; print File::Spec->abs2rel(@ARGV) . \"\n\"' " . fPath . " " . bPath)
  " if yolo !~ '^\.\.\/'
  "   let yolo = \"./" . yolo
  " endif

  return substitute(relPath, '\(\(\/index\)\?\(\.ts\|\.js\)\)\?\n\+$', '', '')
endfunction

inoremap <expr> <c-o><c-p> fzf#complete(fzf#wrap({
  \ 'source':  'ag -g ""',
  \ 'reducer': function('<sid>make_path')}))
