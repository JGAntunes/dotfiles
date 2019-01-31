#!/bin/bash

fish_path=/usr/bin/fish

install_from_dpkg_list () {
  # Add PPAs
  <tilde/.ppa.list xargs -I % sudo add-apt-repository %
  # Install missing packages
  sudo apt update
  sudo apt-get install dselect
  sudo dselect update
  sudo dpkg --set-selections < tilde/.dpkg.list
  sudo apt-get dselect-upgrade -y
  # Set gpg alias
  alias gpg="gpg2"
}

install_from_dpkg_list
