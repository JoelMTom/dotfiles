#!/bin/bash

config_dir=$(pwd)
stow_dir="$HOME/dotfiles"

. "$config_dir/install_packages"
. "$config_dir/install_dwm"

initialize() {
  if [[ ! -d $stow_dir ]]; then
    echo "Creating stow directory in $HOME"
    mkdir $stow_dir
    install_yay()
  fi

}

initialize
install_dwm
