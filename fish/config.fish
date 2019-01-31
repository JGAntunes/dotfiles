# misc vars
set -gx DOTFILES ~/workspace/github/dotfiles

# theme configs
set -gx theme_display_git_untracked yes
set -gx theme_display_k8s_context yes
set -gx theme_display_user yes
set -gx theme_display_git yes
set -gx theme_color_scheme terminal
set -gx theme_display_date no
set -gx theme_display_cmd_duration no

# set the used platform
if test (uname -s) = 'Darwin'
  set -gx IS_OSX 1
  set -gx PATH /usr/local/homebrew/bin $PATH
else if string match -q -- "*Linux*"  (uname -s)
  set -gx IS_LINUX 1

  # set gpg alias
  alias gpg="gpg2"
end

# add aws completions
test -x (which aws_completer);\
  and complete --command aws --no-files --arguments\
  '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# postexec hook for brew to update brewfile
function postexec --on-event fish_postexec
  if test (count $argv) -ge 1; and test $IS_OSX -eq 1
    if string match -q -- "*brew install*" $argv;\
      or string match -q -- "*brew cask install*" $argv;\
      or string match -q -- "*brew remove*" $argv;

      brew bundle dump --force --global

      pushd $DOTFILES
      set files (git diff --name-only)

      if test (count $files) -eq 1; and set -l index (contains -i -- 'tilde/.Brewfile' $files)
        read -l -P 'Commit Brewfile? [y/N] ' confirm
        if test $confirm = 'Y' -o $confirm = 'y' -o $confirm = 'yes';
          set -q DOTFILES_MSG; or set DOTFILES_MSG 'Updated Brewfile :beer:'
          git commit -am $DOTFILES_MSG
          git push
        end
      end
      popd
    end
  end
end


# postexec hook for apt to update dpkg list
function postexec --on-event fish_postexec
  if test (count $argv) -ge 1; and test $IS_LINUX -eq 1
    if string match -q -- "*apt install*" $argv;\
      or string match -q -- "*apt-get install*" $argv;

      # get the installed software
      set installed (string split  -m1 -r ' ' (string trim $argv))

      # confirm we want to submit installed software to dpkg list
      read -l -P 'Store in dpkg list file? [y/N] ' confirm
      if test $confirm = 'Y' -o $confirm = 'y' -o $confirm = 'yes';
        pushd $DOTFILES
        echo "$installed install" >> ./tilde/.dpkg.list

        # commit the changes
        set files (git diff --name-only)
        if test (count $files) -eq 1; and set -l index (contains -i -- 'tilde/.dpkg.list' $files)
          read -l -P 'Commit dpkg list? [y/N] ' confirm
          if test $confirm = 'Y' -o $confirm = 'y' -o $confirm = 'yes';
            if test (count $files) -eq 1; and set -l index (contains -i -- 'tilde/.dpkg.list' $files)
              set -q DOTFILES_MSG; or set DOTFILES_MSG "Updated dpkg list with $installed"
              git commit -am $DOTFILES_MSG
              git push
            end
          end
        end
        popd
      end
    end
  end
end

if status --is-interactive
  set BASE16_SHELL "$DOTFILES/base16-shell"
  source "$BASE16_SHELL/profile_helper.fish"
end
