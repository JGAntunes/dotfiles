#!/bin/bash

fish_path=/usr/local/bin/fish
brew_path=/usr/local/bin/brew

# make the mac keyboard actually usable
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2

install_brew () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
}

install_from_brewfile () {
  $brew_path update --force
  echo "Installing brew dependencies, it will take 💩💩💩 loads of time. Time  a ☕️"
  # work around for bundle failing if packages already installed :shrug:
  $brew_path bundle --verbose --force --file=tilde/.Brewfile || true
  # install python support for neovim
  pip3 install --user neovim
}

# create symlinks for cross os compatibility
symlinks () {
  ln -sf $(which gpg) /usr/local/bin/gpg2
  ln -sf $(which pinentry-curses) /usr/local/bin/pinentry-curses
}

install_brew
install_from_brewfile
symlinks
