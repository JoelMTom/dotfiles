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
source "$config_dir/config_plymouth"
source "$config_dir/config_tmux"
source "$config_dir/config_yazi"

initialize() {
  _writeLog 0 "Initializing"
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
install_config_dwm "JoelMTom/chadwm.git"
basic_packages="neovim ghostty exa bat firefox zoxide thefuck fzf zen-browser-bin plymouth cmake yazi"
install_packages_using_yay "$basic_packages" "--needed"
config_nvim
config_ghostty
rm "$HOME/.bashrc"
copyfile "$config_dir/.bashrc" "$stow_dir"
install_config_plymouth
install_config_tmux
install_config_yazi

install_stow
stow -d "$HOME/dotfiles" -t "$target_dir" --dotfiles -S stow


# TEST

# git_url="https://github.com/joelmtom/chadwm.git"
# clone_dir="$HOME/dotfiles-test"
# clone_using_git $git_url $clone_dir
# movedir "$clone_dir/chadwm/eww" "$clone_dir"


