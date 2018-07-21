" colors and aspect
set termguicolors
if $color_scheme
  set background=dark
else
  set background=light
end
" don't show error if there's no theme
silent! colorscheme base16-solarflare

" make comments italic https://stackoverflow.com/a/30937851/1449157
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
highlight xmlAttrib cterm=italic

" visual guideline for 120 characters
set colorcolumn=120

" reduce cpu use and improve scroll speed
" by disabling any line highlight and relative numbers
set nocursorcolumn
set nocursorline
set norelativenumber

" go only back 256 lines when recreating syntax highlight
" highlighting may be incorrect sometimes, but results are faster
syntax sync minlines=256
