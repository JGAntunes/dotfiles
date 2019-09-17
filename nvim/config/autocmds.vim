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
