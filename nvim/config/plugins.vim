" MatchTagAlways, add javascript
let g:mta_filetypes = {
  \ 'javascript': 1,
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1
\}

" ale
" Linting setup
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'typescript': ['prettier', 'tslint'],
\}
let g:ale_linters = {
\   'shell': ['shellcheck'],
\   'javascript': ['standard', 'eslint'],
\   'typescript': ['tsserver', 'typecheck'],
\}

" Shitty typescript stuff
let g:ale_typescript_tslint_use_global = 0
let g:ale_typescript_tslint_config_path = ''
let g:ale_linters_ignore = {'typescript': ['tslint']}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_open_list = 'on_save'
let g:ale_lint_delay = 1000
let g:ale_lint_on_enter = 0 " don't lint when we open a file
let g:ale_sign_error = '✖' " looks nicer than the default >>
let g:ale_sign_warning = '⚑'

" Show open buffers
let g:airline#extensions#tabline#enabled = 1

" close vim if the only window left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ale
" :command! AleBufferToggleFixers let b:ale_fix_on_save = !get(b:, 'ale_fix_on_save', 1)

" FZF.vim
let g:fzf_prefer_tmux = 1

" Go plugin config
" close autocomplete preview
" set completeopt=menu
" Run goimports along gofmt on each save
let g:go_fmt_command = "goimports"
" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1
" Autocomplete on dot press
"au filetype go inoremap <buffer> . .<C-x><C-o>
" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
