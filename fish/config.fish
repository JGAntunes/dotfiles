# theme configs
set -gx theme_display_git_untracked yes
set -gx theme_display_user no
set -gx theme_display_git yes
set -gx theme_color_scheme solarized
set -gx theme_display_date no
set -gx theme_display_cmd_duration no

if type "balias" > /dev/null 2>&1;
    balias g 'git'
    balias gout 'git checkout'
    balias glow 'git flow'
    balias me 'cd ~/playground'
    balias work 'cd ~/work'
end

# use ag to pipe the results to fzf, ag respects the gitignore
set -gx FZF_DEFAULT_COMMAND 'ag -g ""'
set -gx DOTFILES ~/playground/dotfiles
if test (uname -s) = 'Darwin'
  set -gx PATH /usr/local/homebrew/bin $PATH
end
if test -d ~/platform-tools
  set -gx PATH ~/platform-tools $PATH
end


function postexec --on-event fish_postexec
  if test (count $argv) -ge 1
    if string match -q -- "brew install*" $argv; or string match -q -- "brew cask install*" $argv
      set file (string join '' $DOTFILES '/Brewfile')
      brew bundle dump --force --file=$file

      read -l -P 'Do you want to continue? [y/N] ' confirm
			if test $confirm = 'Y' -o $confirm = 'y' -o $confirm = 'yes';
				pushd $DOTFILES
				set files (git diff --name-only)
				if test (count $files) -eq 1; and set -l index (contains -i -- 'Brewfile' $files)
					git commit -am "Brewfile"
					git push
				else
					echo "Multiple files have changed, please do a manual commit"
				end
				popd
			end
    end
  end
end
