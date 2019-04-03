"
" Auto commands
"

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" set json syntax to rc files
autocmd BufNewFile,BufRead .babelrc,.eslintrc,.stylelintrc setlocal filetype=json
