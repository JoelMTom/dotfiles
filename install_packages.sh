#!/bin/bash

current_dir=$(pwd)
home=$HOME

cd $home
# echo $(pwd)

### Installing git, base-devel

packages = "git base-devel stow picom feh acpi rofi"
sudo pacman -S "$packages" --needed

### Installing yay

cd $current_dir
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $current_dir

### Installing JetBrainsMono Nerf Font

sudo pacman -S ttf-jetbrainsmono-nerd
