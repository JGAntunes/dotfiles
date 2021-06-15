"
" Auto commands
"

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" set json syntax to rc files
autocmd BufNewFile,BufRead .babelrc,.eslintrc,.stylelintrc setlocal filetype=json

" comments for jsx files default to //
autocmd FileType typescript.tsx setlocal commentstring=//\ %s
autocmd FileType javascript.jsx setlocal commentstring=//\ %s


" Go lang
" test
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" definition
autocmd FileType go nmap <leader>d  <Plug>(go-def)
" back from definition
autocmd FileType go nmap <leader>s  <Plug>(go-def-pop)
" get function callers
autocmd FileType go nmap <leader>c  <Plug>(go-callers)
