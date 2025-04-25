set encoding=utf8

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" Color scheme
Plug 'chriskempson/base16-vim'
" NerdTree navigation bar <3
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Support for multiple cursors
Plug 'mg979/vim-visual-multi'
" Plug 'roxma/nvim-completion-manager'
Plug 'https://github.com/editorconfig/editorconfig-vim'
" GraphQL syntax highlight
Plug 'jparise/vim-graphql'

" Shitty typescript :(
Plug 'HerringtonDarkholme/yats.vim'
Plug 'peitalin/vim-jsx-typescript'

" Still need ale for things such as shellcheck
Plug 'w0rp/ale'

" Syntax Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Javascript, Node and React
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
" Syntax support for handlebars
Plug 'mustache/vim-mustache-handlebars'
" Syntax support for toml
Plug 'cespare/vim-toml'
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
" Git commit messages, diffs and more
Plug 'rhysd/git-messenger.vim'
" Which and exec functions targeted at local node projects
Plug 'jaawerth/nrun.vim'
" Visual status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Pairs of {} and stuff
Plug 'jiangmiao/auto-pairs'
" Easily surround sutff with tags, brackets, quotes, etc
Plug 'tpope/vim-surround'
" Highlight matching tags
" Plug 'valloric/MatchTagAlways'
" Auto completion super powers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Ruby
Plug 'tpope/vim-rails'
" Terraform
Plug 'hashivim/vim-terraform'
" Syntax highlighting plugin for JSON with C-style line (e.g. coc-settings.json)
Plug 'kevinoid/vim-jsonc'
" fuzzy searching using fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Setup copilot
Plug 'github/copilot.vim'
call plug#end()

" Check's for vimrc background and sources it
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source $HOME/.vimrc_background
endif

" Coc extensions
let g:coc_global_extensions = ['coc-json', 'coc-deno', 'coc-tsserver', 'coc-prettier', 'coc-go']

" load configs
runtime! config/*.vim
