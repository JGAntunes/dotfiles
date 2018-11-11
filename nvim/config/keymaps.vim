"
" Keymaps
"

" clear highlights by hitting ctrl /
nnoremap \ :noh<CR>

" Save file using sudo, if we don't have permissions
cnoremap w!! w !sudo tee %

" open terminal mode vertical split with 10 lines
nnoremap <Leader>t :10split +te<CR>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle spellcheck
map <Leader>sc :setlocal spell!<CR>

" when pasting, set paste mode first, then paste, then set paste mode off
inoremap <C-v> <F10><C-r>+<F10>

" shortcut split vertically 
map <Leader>v :vsplit<CR>

" clean up any trailing whitespace
nnoremap <Leader>w :%s/\s\+$//<cr>:let @/=''<cr>

" stolen from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Move to the beginning/end of the line with H and L
noremap H ^
noremap L $

" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
" useful for visual line breaks, done by vim
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" make copy/paste from system clip easier
vnoremap <Leader>8 "*y
vnoremap <Leader>9 "*p
nnoremap <Leader>8 "*p

" ale
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
nmap <silent> <Leader>td <Plug>(ale_go_to_definition)
nmap <silent> <Leader>tr <Plug>(ale_find_references)


" toggle folds with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" expand all folds when entering a file
autocmd BufWinEnter * silent! :%foldopen!

" Edit my init.vim and source my edit.vim
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

" FZF.vim
nnoremap <Leader>p :Files<cr>
nnoremap <Leader>f :Ag<cr>
nnoremap <Leader>b :Buffers<cr>

nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)

" autoclose tag with omnifunc
iabbrev </ </<C-X><C-O>

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" splitjoin
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" using fzf to search for a file and generate a relative path, relative to
" current buffer
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
