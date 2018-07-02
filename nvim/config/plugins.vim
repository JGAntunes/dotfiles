" airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ultisnips_javascript = {
  \ 'keyword-spacing': 'always',
  \ 'semi': 'never',
  \ 'space-before-function-paren': 'always',
  \ }

" MatchTagAlways, add javascript
let g:mta_filetypes = {
  \ 'javascript': 1,
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1
\}

" ale
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['tslint'],
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint', 'tsserver', 'typecheck'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 'on_save'
let g:ale_lint_delay = 1000

" Emmet remap
let g:user_emmet_leader_key='<C-Z>'

" deoplete allow JSX in normal JS files
let g:jsx_ext_required = 0
let g:deoplete#enable_at_startup = 1
" deoplete and tern configs
let g:tern_request_timeout = 1
" This do disable full signature type on autocomplete
let g:tern_show_signature_in_pum = '0'  
let g:deoplete#file#enable_buffer_path = '1'
"Add extra filetypes
let g:tern#filetypes = ['jsx', 'javascript.jsx']
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]


" vim-javascript
let g:javascript_plugin_flow = 1

" FZF.vim
let g:fzf_prefer_tmux = 1

" qf
let g:qf_window_bottom = 0
let g:qf_loclist_window_bottom = 0
let g:qf_auto_resize = 0
let g:qf_nowrap = 0

