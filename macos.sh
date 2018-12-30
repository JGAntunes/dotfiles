#!/bin/bash

fish_path=/usr/local/homebrew/bin/fish
brew_path=/usr/local/homebrew/bin/brew

# make the mac keyboard actually usable
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2

install_brew () {
  rm -rf homebrew; mkdir homebrew
  curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew && \
  sudo mv homebrew /usr/local/
}

install_from_brewfile () {
  $brew_path update --force
  echo "Installing brew dependencies, it will take 💩💩💩 loads of time. Time  a ☕️"
  $brew_path bundle --verbose --force
  # install python support for neovim
  pip3 install --user neovim
}

install_brew
install_from_brewfile
