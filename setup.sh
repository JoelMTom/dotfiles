#!/bin/bash

config_dir=$(pwd)
stow_dir="$HOME/dotfiles/stow"
dot_config_dir="$stow_dir/dot-config"
target_dir="$HOME"
echo "config_dir = $config_dir"
echo "stow_dir = $stow_dir"
echo "dot_config_dir = $dot_config_dir"

. "$config_dir/install_packages"
. "$config_dir/install_dwm"
. "$config_dir/config_nvim"
. "$config_dir/config_ghostty"

initialize() {
  echo "Initializing"
  if [[ ! -d $stow_dir ]]; then
    echo "Creating stow directory in $HOME"
    mkdir -p $stow_dir
  fi
  if [[ ! -d "$dot_config_dir" ]]; then
    echo "Creating dot-config directory in $stow_dir"
    mkdir "$dot_config_dir"
  fi
  install_yay
}

initialize
install_config_dwm "JoelMTom/chadwm.git"
basic_packages="neovim ghostty exa bat firefox"
config_nvim
config_ghostty

# install_stow
stow -d "$HOME/dotfiles" -t "$target_dir" --dotfiles -S stow


# TEST

# git_url="https://github.com/joelmtom/chadwm.git"
# clone_dir="$HOME/dotfiles-test"
# clone_using_git $git_url $clone_dir
# movedir "$clone_dir/chadwm/eww" "$clone_dir"


