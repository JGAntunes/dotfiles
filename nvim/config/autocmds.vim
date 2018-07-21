"
" Auto commands
"

" highlight current line
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" set json syntax to rc files
autocmd BufNewFile,BufRead .babelrc,.eslintrc,.stylelintrc setlocal filetype=json

" markdown
autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999


" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" reset cursor position on files, if it's remembered
" but don't do it for gitcommit file types
autocmd BufReadPost * if &filetype != "gitcommit" && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" qf automatically close corresponding loclist when quitting a window
augroup qf
  autocmd!
  autocmd QuitPre * if &filetype != 'qf' | silent! lclose | endif
augroup END

" UltiSnips
autocmd FileType typescript UltiSnipsAddFiletypes typescript-angular
autocmd CompleteDone * pclose

" support for tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx
