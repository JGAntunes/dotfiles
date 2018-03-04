set nocompatible
set encoding=utf8

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

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
Plug 'romainl/vim-qf', {'branch': 'issue#63' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install --global tern' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" Colours
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

source ~/playground/dotfiles/nvim/config/settings.vim
source ~/playground/dotfiles/nvim/config/autocmds.vim
source ~/playground/dotfiles/nvim/config/keymaps.vim
if has('nvim')
  source ~/playground/dotfiles/nvim/config/keymaps-nvim.vim
end
" configs for plugins
source ~/playground/dotfiles/nvim/config/plugins.vim

