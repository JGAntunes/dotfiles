" Nerd Tree shortcut
map <C-t> :NERDTreeToggle<CR>

" ale
" nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
" nmap <silent> <Leader>j <Plug>(ale_next_wrap)
" nmap <silent> <Leader>td <Plug>(ale_go_to_definition)
" nmap <silent> <Leader>tr <Plug>(ale_find_references)

" Go
" Disable GoDef default mapping
let g:go_def_mapping_enabled = 0
" Disable go-vim auto linting, vet and stuff on save
" We're defaulting to using COC vim for it
let g:go_metalinter_autosave = 0
" Auto formatting and importing
" let g:go_fmt_autosave = 1
" let g:go_fmt_command = "goimports"
" Show function info
let g:go_auto_type_info = 1


" multicursor config
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]    = '<C-j>'
let g:VM_maps["Add Cursor Up"]      = '<C-k>'
let g:VM_maps["Start Regex Search"] = '<Leader>/'

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

" COC Vim
" Use tab for trigger completion with characters ahead and navigate.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" COC Vim GoTo code navigation.
nmap <silent> <Leader>gd <plug>(coc-definition)
nmap <silent> <Leader>gy <plug>(coc-type-definition)
nmap <silent> <Leader>gi <plug>(coc-implementation)
nmap <silent> <Leader>gr <plug>(coc-references)

