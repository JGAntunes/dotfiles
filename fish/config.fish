# misc vars
set -gx DOTFILES ~/workspace/github/dotfiles

# theme configs
set -gx theme_color_scheme solarized
set -gx theme_display_git_untracked yes
set -gx theme_display_k8s_context yes
set -gx theme_display_user yes
set -gx theme_display_git yes
set -gx theme_display_date no
set -gx theme_display_cmd_duration no

# locale config
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# source alias
source ~/.config/fish/alias.fish

# use ag to pipe the results to fzf, ag respects the gitignore
set -gx FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""'

# set the used platform
set -gx IS_OSX 0
set -gx IS_LINUX 0
if test (uname -s) = 'Darwin'
  set -gx IS_OSX 1
  set -gx PATH /usr/local/homebrew/bin $PATH
  # source cargo env if present
  if test -f $HOME/.cargo/env
    bass source $HOME/.cargo/env
  end
  # source the gcloud cli if present
  if test -f (brew --prefix)"/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
    source (brew --prefix)"/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"
  end
  # source asdf if present
  if test -f (brew --prefix asdf)"/asdf.fish"
    source (brew --prefix asdf)"/asdf.fish"
  end
else if string match -q -- "*Linux*"  (uname -s)
  set -gx IS_LINUX 1
end

# gpg-agent config
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye > /dev/null

# add aws completions
test -x (which aws_completer);\
  and complete --command aws --no-files --arguments\
  '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# postexec hook to update dependency lists
function postexec --on-event fish_postexec
  if test (count $argv) -ge 1; and test $IS_OSX -eq 1
    updateBrewfile $argv
  end
  if test (count $argv) -ge 1; and test $IS_LINUX -eq 1
    updateDpkgList $argv
  end
end

# update the brewfile
function updateBrewfile
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


# update dpkg list
function updateDpkgList
  if string match -q -- "*apt install*" $argv;\
    or string match -q -- "*apt-get install*" $argv;

    # get the installed software
    set installed (string split  -m1 -r ' ' (string trim $argv))[2]

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
