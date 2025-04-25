" colors and aspect
set termguicolors

" colors and aspect
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" make comments italic https://stackoverflow.com/a/30937851/1449157
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
highlight xmlAttrib cterm=italic
