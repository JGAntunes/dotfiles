" Nerd Tree shortcut
map <C-t> :NERDTreeToggle<CR>

" Neomake navigation
nnoremap <leader><leader>b :ll<CR>         " go to current error/warning
nnoremap <leader><leader>m :lnext<CR>      " next error/warning
nnoremap <leader><leader>n :lprev<CR>      " previous error/warning

" snippet config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" multicursor config
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]    = '<C-j>'
let g:VM_maps["Add Cursor Up"]      = '<C-k>'
let g:VM_maps["Start Regex Search"] = '<Leader>g'

" FZF.vim
nnoremap <Leader>p :Files<cr>
nnoremap <Leader>f :Ag<cr>
nnoremap <Leader>b :Buffers<cr>

" FZF maps, LOL, LOVE IT @FabioAntunes
nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-p> <plug>(fzf-complete-path)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
