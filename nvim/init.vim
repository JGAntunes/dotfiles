set encoding=utf8

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Color scheme
" Plug 'chriskempson/base16-vim'
" NerdTree navigation bar <3
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Support for multiple cursors
Plug 'mg979/vim-visual-multi'
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
" Plug 'rking/ag.vim' 
" fuzzy searching using fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" load configs
source ~/workspace/github/dotfiles/nvim/config/base.vim
source ~/workspace/github/dotfiles/nvim/config/visuals.vim
source ~/workspace/github/dotfiles/nvim/config/plugins.vim
source ~/workspace/github/dotfiles/nvim/config/plugins-keymaps.vim
