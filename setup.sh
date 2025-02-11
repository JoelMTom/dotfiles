#!/bin/bash

config_dir=$(pwd)
stow_dir="$HOME/dotfiles"
dot_config_dir="$stow_dir/dot-config"
target_dir="$HOME"
echo "config_dir = $config_dir"
echo "stow_dir = $stow_dir"
echo "dot_config_dir = $dot_config_dir"

. "$config_dir/install_packages"
. "$config_dir/install_dwm"

initialize() {
  echo "Initializing"
  if [[ ! -d $stow_dir ]]; then
    echo "Creating stow directory in $HOME"
    mkdir $stow_dir
  fi
  if [[ ! -d "$dot_config_dir" ]]; then
    echo "Creating dot-config directory in $stow_dir"
    mkdir "$dot_config_dir"
  fi
  install_yay
}

initialize
install_config_dwm "JoelMTom/chadwm.git"

install_packages_using_pacman "stow"
stow -d "$HOME" -t "$target_dir" --dotfiles -S dotfiles
