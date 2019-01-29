call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/terryma/vim-multiple-cursors'
" Plug 'roxma/nvim-completion-manager'
Plug 'https://github.com/editorconfig/editorconfig-vim'


" Syntax support for fish script
Plug 'dag/vim-fish'
" Syntax support for bats
Plug 'vim-scripts/bats.vim'
" Syntax support for helm
Plug 'towolf/vim-helm'
" Syntax support for LaTex
Plug 'lervag/vimtex'
" Comments
Plug 'tpope/vim-commentary'
" Git status on the side
Plug 'airblade/vim-gitgutter'
" Which and exec functions targeted at local node projects
Plug 'jaawerth/nrun.vim'
" Run async progs
Plug 'neomake/neomake'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Pairs of {} and stuff
Plug 'jiangmiao/auto-pairs'
" ag plugin
Plug 'rking/ag.vim' 
call plug#end()

" keep buffer state (can use U on previously closed stuff)
set hidden
" nerd tree shortcut
map <C-t> :NERDTreeToggle<CR>
" close vim if the only window left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" enable autocomplete
" let g:deoplete#enable_at_startup = 1
" neomake
let g:neomake_open_list = 2
" JS linting setup
" let g:neomake_javascript_enabled_makers = ['standard']
" let g:neomake_javascript_enabled_makers = ['standard','semistandard']
let g:neomake_javascript_enabled_makers = ['standard', 'semistandard', 'eslint']
autocmd Filetype javascript let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
autocmd Filetype javascript let g:neomake_javascript_semistandard_exe = nrun#Which('semistandard')
autocmd Filetype javascript let g:neomake_javascript_standard_exe = nrun#Which('standard')
autocmd! BufWritePost *.js Neomake
" Shell linting setup
let g:neomake_shell_enabled_makers = ['shellcheck']
let g:neomake_shellcheck_args = ['-fgcc']
autocmd! BufWritePost *.sh Neomake
autocmd! BufWritePost *.bash Neomake
nnoremap <leader><leader>b :ll<CR>         " go to current error/warning
nnoremap <leader><leader>m :lnext<CR>      " next error/warning
nnoremap <leader><leader>n :lprev<CR>      " previous error/warning

" line numbers
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

" tabs and indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" clear highlights by hitting ESC
" or by hitting enter in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <CR> :noh<CR><CR>

" lang
set spelllang=en_gb

" snippet config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
set guicursor=

" disable arrow keys, YOLO
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
