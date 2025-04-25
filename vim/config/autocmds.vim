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
autocmd FileType go nmap <leader>tf  <Plug>(go-test-func)
" definition
autocmd FileType go nmap <leader>gd  <Plug>(go-def-split)
" back from definition
autocmd FileType go nmap <leader>gs  <Plug>(go-def-pop)
" get function callers
autocmd FileType go nmap <leader>gc  <Plug>(go-callers)
" show the interfaces the type implements
autocmd FileType go nmap <leader>gi  <Plug>(go-implements)
" generate the if err != nil {return ...} automatically 
autocmd FileType go nmap <leader>ge  <Plug>(go-iferr)
" switch between implementation and test code
autocmd FileType go nmap <leader>ga  <Plug>(go-alternate-vertical)
" go debug
autocmd FileType go nmap <leader>d  :GoDebugStart<CR>
autocmd FileType go nmap <leader>dt  :GoDebugTest<CR>
autocmd FileType go nmap <leader>dq  :GoDebugStop<CR>
autocmd FileType go nmap <leader>dh  :GoDebugHalt<CR>
autocmd FileType go nmap <leader>db  :GoDebugBreakpoint<CR>
autocmd FileType go nmap <leader>dn  :GoDebugNext<CR>
autocmd FileType go nmap <leader>dc  :GoDebugContinue<CR>
autocmd FileType go nmap <leader>ds  :GoDebugStep<CR>
