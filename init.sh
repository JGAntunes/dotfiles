#!/bin/bash

fish_path=/usr/local/homebrew/bin/fish
brew_path=/usr/local/homebrew/bin/brew

config_git () {
  echo "git user name:"
  read username
  echo "git email:"
  read email

  git config --global user.name $username
  git config --global user.email $email
}

install_brew () {
  rm -rf homebrew; mkdir homebrew
  curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew && \
  sudo mv homebrew /usr/local/
}

install_from_brewfile () {
  $brew_path update --force
  echo "Installing brew dependencies, it will take a while. Time for a ☕️"
  $brew_path bundle --verbose --force
  # install python support for neovim
  pip3 install --user neovim
}

set_fish_shell () {
  echo $fish_path | sudo tee -a /etc/shells
  chsh -s $fish_path
}

install_powerfonts () {
  # clone
  command git clone https://github.com/powerline/fonts.git --depth=1 && \
  # install
  cd fonts && \
  command bash install.sh && \
  # clean-up a bit
  cd ..; rm -rf fonts/
}

install_nvm () {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  nvm install --lts
}

start_yolo_fish () {
  $fish_path yolo.fish
}

if [[ $EUID -eq 0 ]]; then
    error "This script should not be run using sudo or as the root user"
    exit 1
fi

config_git
install_nvm
install_brew
install_from_brewfile
set_fish_shell

install_powerfonts
start_yolo_fish
touch ~/.hushlogin
