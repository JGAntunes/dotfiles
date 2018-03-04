" clear highlights by hitting ESC
" or by hitting enter in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <CR> :noh<CR><CR>

" map uppercase and mixed case 
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Save file using sudo, if we don't have permissions
cnoremap w!! w !sudo tee %

" open terminal mode vertical split with 10 lines
nnoremap <leader>t :10split +te<cr>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle spellcheck
map <leader>sc :setlocal spell!<CR>

" when pasting, set paste mode first, then paste, then set paste mode off
inoremap <C-v> <F10><C-r>+<F10>

" shortcut split vertically 
map <leader>v :vsplit<CR>

" clean up any trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<cr>

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
vnoremap <leader>8 "*y
vnoremap <leader>9 "*p
nnoremap <leader>8 "*p

" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" toggle folds with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" expand all folds when entering a file
autocmd BufWinEnter * silent! :%foldopen!

" Edit my init.vim and source my edit.vim
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" FZF.vim
nnoremap <leader>p :Files<cr>
nnoremap <leader>f :Ag<cr>
nnoremap <leader>b :Buffers<cr>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" using fzf to search for a file and generate a relative path, relative to
" current buffer
function! s:make_path(path)
  let bPath = expand('%:p:h')
  let fPath = substitute(system("realpath " . join(a:path)), '\n\+', '', '')
  " my implementation to generate relative paths, a golang binary
  if executable("rel-path")
    let relPath = system("rel-path " . fPath . " " . bPath)
  else
    " we default to Perl
    let relPath = system("perl -e 'use File::Spec; print File::Spec->abs2rel(@ARGV) . \"\n\"' " . fPath . " " . bPath)
    if relPath !~ '^\.\.\/'
      let relPath = \"./" . relPath
    endif
  endif

  return substitute(relPath, '\(\(\/index\)\?\(\.ts\|\.js\)\)\?\n\+$', '', '')
endfunction

inoremap <expr> <c-o><c-p> fzf#complete(fzf#wrap({
  \ 'source':  'ag -g ""',
  \ 'reducer': function('<sid>make_path')}))

