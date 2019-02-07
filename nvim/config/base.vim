

let mapleader=","
noremap \ ,

" keep buffer state (can use U on previously closed stuff)
set hidden
" enable autocomplete
" let g:deoplete#enable_at_startup = 1

" check if file was changed outside of vim
set autoread

" command line completions
set wildmenu
set wildmode=full

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

" https://github.com/neovim/neovim/wiki/FAQ#nvim-shows-weird-symbols-2-q-when-changing-modes
set guicursor=

" Save file using sudo, if we don't have permissions
cnoremap w!! w !sudo tee %

" make copy/paste from system clip easier
vnoremap <Leader>8 "*y
vnoremap <Leader>9 "*p
nnoremap <Leader>9 "*p

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

" disable arrow keys, YOLO
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
