" map uppercase and mixed case 
:command! W w
:command! WA wa
:command! Wa wa
:command! WQ wq
:command! Wq wq
:command! Q q
:command! QA qa
:command! Qa qa
:command! Up up
:command! UP up

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Edit vim configs
:command! DotAutoCmds vsplit $HOME/playground/dotfiles/nvim/config/autocmds.vim
:command! DotCommands vsplit $HOME/playground/dotfiles/nvim/config/commands.vim
:command! DotKeymaps vsplit $HOME/playground/dotfiles/nvim/config/keymaps.vim
:command! DotKeymapsNvim vsplit $HOME/playground/dotfiles/nvim/config/keymaps-nvim.vim
:command! DotPlugins vsplit $HOME/playground/dotfiles/nvim/config/plugins.vim
:command! DotSettings vsplit $HOME/playground/dotfiles/nvim/config/settings.vim

:command! AleBufferToggleFixers let b:ale_fix_on_save = !get(b:, 'ale_fix_on_save', 1)
:command! BackgroundColorToggle let &background = ( &background == 'dark'? 'light' : 'dark' )
