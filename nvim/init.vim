set nocompatible
set encoding=utf8

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Syntax
Plug 'tpope/vim-git'
Plug 'dag/vim-fish'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'HerringtonDarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'moll/vim-node'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss'] }
Plug 'ap/vim-css-color'
Plug 'styled-components/vim-styled-components'

Plug 'w0rp/ale'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install --global tern' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
" checks for local node packages, defaults to global useful for eslint, etc
Plug 'jaawerth/nrun.vim'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install --global tern' }

" Run async stuff
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" autoclose tags
Plug 'alvan/vim-closetag'
" emmet support
Plug 'mattn/emmet-vim'
" enhanced quickfix window
Plug 'romainl/vim-qf'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Split and join lines
Plug 'AndrewRadev/splitjoin.vim'
" highlights matching tags
Plug 'Valloric/MatchTagAlways'
" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
" Asks to create directories in Vim when needed
Plug 'jordwalke/VimAutoMakeDirectory'
" fuzzy searching using fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" searches for local vimrc files and loads them, useful for extra config for a specfic project
Plug 'embear/vim-localvimrc'
" searches for the current selection, rather than the current word
Plug 'thinca/vim-visualstar'
" toggles comments
Plug 'tpope/vim-commentary'
" Provides easier unix commands like :Delete :Rename etc
Plug 'tpope/vim-eunuch'
" Git shortcuts like :Gblame :Gstatus etc
Plug 'tpope/vim-fugitive'
" enhanced repeat of the last command
Plug 'tpope/vim-repeat'
" easily surround sutff with tags, brackets, quotes, etc
Plug 'tpope/vim-surround'
" auto close parent tag under cursor
Plug 'docunext/closetag.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

" themes and status bar
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" load configs
source ~/playground/dotfiles/nvim/config/autocmds.vim
source ~/playground/dotfiles/nvim/config/commands.vim
source ~/playground/dotfiles/nvim/config/plugins.vim
source ~/playground/dotfiles/nvim/config/settings.vim
source ~/playground/dotfiles/nvim/config/keymaps.vim
if has('nvim')
  source ~/playground/dotfiles/nvim/config/keymaps-nvim.vim
end
