" highlight current line
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" line numbers autocmd
augroup linenumbers
  autocmd!
  autocmd BufEnter *    :set relativenumber
  autocmd BufLeave *    :set number norelativenumber
  autocmd WinEnter *    :set relativenumber
  autocmd WinLeave *    :set number norelativenumber
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd FocusLost *   :set number norelativenumber
  autocmd FocusGained * :set relativenumber
augroup END

" set json syntax to rc files
autocmd BufNewFile,BufRead .babelrc,.eslintrc,.stylelintrc setlocal filetype=json

" markdown
autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999

" https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
" has to go after all  declarations
highlight Comment cterm=italic
autocmd FileType javascript highlight xmlAttrib cterm=italic

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

" neomake
autocmd Filetype javascript let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
autocmd Filetype javascript let g:neomake_javascript_stylelint_exe = nrun#Which('stylelint')
autocmd! BufWritePost *.js Neomake


" prettier
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql if prettier#enabled | PrettierAsync | endif

" UltiSnips
autocmd FileType typescript UltiSnipsAddFiletypes typescript-angular
autocmd CompleteDone * pclose

