#!/bin/bash

config_dir=$(pwd)
stow_dir="$HOME/dot-config"
echo "config_dir = $config_dir"
echo "stow_dir = $stow_dir"

. "$config_dir/install_packages"
. "$config_dir/install_dwm"

initialize() {
  echo "Initializing"
  if [[ ! -d $stow_dir ]]; then
    echo "Creating stow directory in $HOME"
    mkdir $stow_dir
    install_yay
  fi
}

initialize
install_config_dwm "siduck/chadwm.git"


