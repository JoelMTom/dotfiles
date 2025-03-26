config_dir=$(pwd)
stow_dir="$HOME/dotfiles/stow"
dot_config_dir="$stow_dir/dot-config"
target_dir="$HOME"
include_dir="$config_dir/includes"
echo "config_dir = $config_dir"
echo "stow_dir = $stow_dir"
echo "dot_config_dir = $dot_config_dir"

source "$include_dir/log.sh"
source "$config_dir/install_packages"
source "$config_dir/install_dwm"
source "$config_dir/config_nvim"
source "$config_dir/config_ghostty"
source "$config_dir/config_tmux"
source "$config_dir/config_yazi"
source "$config_dir/config_backlight"

initialize() {
  _writeLog 0 "Initializing"
  sudo pacman -Syu
  if [[ ! -d $stow_dir ]]; then
    _writeLog 0 "Creating stow directory in $HOME"
    mkdir -p $stow_dir
  fi
  if [[ ! -d "$dot_config_dir" ]]; then
    _writeLog 0 "Creating dot-config directory in $stow_dir"
    mkdir "$dot_config_dir"
  fi
  install_yay
}

initialize
required_fonts="ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji"
install_packages_using_yay "$required_fonts" "--needed"
install_config_dwm "JoelMTom/chadwm.git"
basic_packages="neovim ghostty exa bat firefox zoxide thefuck fzf plymouth zen-browser-bin cmake yazi light clang llvm nodejs npm unzip"
install_packages_using_yay "$basic_packages" "--needed"
config_nvim
config_ghostty
config_backlight
rm "$HOME/.bashrc"
copyfile "$config_dir/.bashrc" "$stow_dir"
install_config_tmux
install_config_yazi

install_stow
stow -d "$HOME/dotfiles" -t "$target_dir" --dotfiles -S stow
