#!/bin/bash

fish_path=/usr/local/bin/fish

# make the mac keyboard actually usable
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2

install_brew () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  # M1 Macbook homebrew install is in /opt/homebrew
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    if ! grep -Fxq  'eval "$(/opt/homebrew/bin/brew shellenv)"' /Users/jgantunes/.bash_profile; then
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jgantunes/.bash_profile
    fi
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # The fish binary is now under /opt/homebrew too
    fish_path=$(which fish)
  fi
}

install_from_brewfile () {
  brew update
  echo "Installing brew dependencies, it will take 💩💩💩 loads of time. Time  a ☕️"
  brew bundle --global --verbose
  # install python support for neovim
  pip3 install --user neovim
}

# create symlinks for cross os compatibility
symlinks () {
  ln -sf $(which gpg) /usr/local/bin/gpg2
  ln -sf $(which pinentry-mac) /usr/local/bin/pinentry-link
}

install_brew
install_from_brewfile
symlinks
