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

" Prettier
let g:prettier#autoformat = 0
let g:prettier#enabled = 1
let g:prettier#config#bracket_spacing = 'true'

" neomake
let g:neomake_open_list = 2
let g:neomake_list_height = 10
let g:neomake_javascript_enabled_makers = ['eslint', 'stylelint']
nnoremap <leader><leader>b :ll<CR>         " go to current error/warning
nnoremap <leader><leader>m :lnext<CR>      " next error/warning
nnoremap <leader><leader>n :lprev<CR>      " previous error/warning

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

