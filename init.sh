#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    error "This script should not be run using sudo or as the root user"
    exit 1
fi

if [ "$(uname)" == "Darwin" ]; then
  fish_path=/usr/local/homebrew/bin/fish
  brew_path=/usr/local/homebrew/bin/brew
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  fish_path=/usr/bin/fish
fi

config_git () {
  # although this file doesn't exist, yet, git doesn't seem to be bothered by that
  git config --global core.excludesfile ~/.gitignore_global
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
  echo "Installing brew dependencies, it will take 💩💩💩 loads of time. Time for a ☕️"
  $brew_path bundle --verbose --force
  # install python support for neovim
  pip3 install --user neovim
}

set_fish_shell () {
  if type $fish_path > /dev/null; then
    echo $fish_path | sudo tee -a /etc/shells
    sudo chsh -s $fish_path

    # start init.fish
    $fish_path init.fish
  fi
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
  # manually source nvm
  \. "$HOME/.nvm/nvm.sh"
  nvm install --lts
}

config_git
install_nvm
install_powerfonts
if [ "$(uname)" == "Darwin" ]; then
  touch ~/.hushlogin
  install_brew
  install_from_brewfile
fi

set_fish_shell
