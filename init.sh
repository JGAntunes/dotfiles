#!/bin/bash
set -ex

if [[ $EUID -eq 0 ]]; then
    error "This script should not be run using sudo or as the root user"
    exit 1
fi

set_fish_shell () {
  if type "$fish_path" > /dev/null; then
    echo "$fish_path" | sudo tee -a /etc/shells
    sudo chsh -s "$fish_path"

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

get_gpg_pub_key () {
  gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 0xC3F49CB32A698E79
}

set_git_hooks () {
  # set path for hooks in the dotfiles
  git config core.hooksPath hooks
  chmod +x hooks/post-merge
}

if [ "$(uname)" == "Darwin" ]; then
  source ./macos.sh
elif [ "$(expr substr "$(uname -s)" 1 5)" == "Linux" ]; then
  source ./linux.sh
fi

get_gpg_pub_key
set_git_hooks
install_nvm
install_powerfonts
set_fish_shell

set +ex
