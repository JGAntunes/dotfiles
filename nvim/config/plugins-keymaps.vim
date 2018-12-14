"
" Plugins Keymaps
"

" ale
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
nmap <silent> <Leader>td <Plug>(ale_go_to_definition)
nmap <silent> <Leader>tr <Plug>(ale_find_references)

" autoclose tag with omnifunc
iabbrev </ </<C-X><C-O>

" splitjoin
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" FZF.vim
nnoremap <Leader>p :Files<cr>
nnoremap <Leader>f :Ag<cr>
nnoremap <Leader>b :Buffers<cr>

nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" using fzf to search for a file and generate a relative path
" relative to the current buffer
function! s:make_path(path)
  let l:currentFile = expand('%:p:h')
  let l:filePath = fnamemodify(join(a:path), ":p")

  " my implementation to generate relative paths, a golang binary
  " check if it exists, if not we default to perl
  if executable("rel-path")
    let l:relPath = system("rel-path " . l:filePath . " " . l:currentFile)
  else
    let l:relPath = system("perl -e 'use File::Spec; print File::Spec->abs2rel(@ARGV) . \"\n\"' " . l:filePath . " " . l:currentFile)
    if l:relPath !~ '^\.\.\/'
      let l:relPath = \"./" . l:relPath
    endif
  endif

  " strip extensions from the file, if it's tsx? jsx? Or strip the entire name
  " if it's an "index.jsx?" or "index.tsx"
  return substitute(l:relPath, '\(\(\/index\)\?\(\.tsx\?\|\.jsx\?\)\)\?\n\+$', '', '')
endfunction

inoremap <expr> <c-o><c-p> fzf#complete(fzf#wrap({
  \ 'source':  'ag -g ""',
  \ 'reducer': function('<sid>make_path')}))

if has('nvim')
  " neovim terminal configs
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l
endif
