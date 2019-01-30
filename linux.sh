#!/bin/bash

fish_path=/usr/bin/fish

install_from_dpkg_list () {
  sudo apt update
  sudo dpkg --set-selections < tilde/.dpkg.list
}

install_from_dpkg_list
