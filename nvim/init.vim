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

" Syntax Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Javascript, Node and React
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
" Syntax support for handlebars
Plug 'mustache/vim-mustache-handlebars'
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
" linter
Plug 'w0rp/ale'
" Visual status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Pairs of {} and stuff
Plug 'jiangmiao/auto-pairs'
" Easily surround sutff with tags, brackets, quotes, etc
Plug 'tpope/vim-surround'
" Highlight matching tags
Plug 'valloric/MatchTagAlways'
" ag plugin
" Plug 'rking/ag.vim' 
" fuzzy searching using fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" load configs
runtime! config/*.vim
