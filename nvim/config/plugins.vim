
" JS linting setup
" let g:neomake_javascript_enabled_makers = ['standard']
" let g:neomake_javascript_enabled_makers = ['standard','semistandard']
let g:neomake_javascript_enabled_makers = ['standard', 'semistandard', 'eslint']
autocmd Filetype javascript let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
autocmd Filetype javascript let g:neomake_javascript_semistandard_exe = nrun#Which('semistandard')
autocmd Filetype javascript let g:neomake_javascript_standard_exe = nrun#Which('standard')
autocmd! BufWritePost *.js Neomake

" Shell linting setup
let g:neomake_shell_enabled_makers = ['shellcheck']
let g:neomake_shellcheck_args = ['-fgcc']
autocmd! BufWritePost *.sh Neomake
autocmd! BufWritePost *.bash Neomake

" close vim if the only window left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" neomake
let g:neomake_open_list = 2

" FZF.vim
let g:fzf_prefer_tmux = 1
