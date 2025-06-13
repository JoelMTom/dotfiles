config_dir=${1:-$(pwd)}
stow_dir="$config_dir"
dot_config_dir="$stow_dir/dot-config"
target_dir=${2:-$HOME}
include_dir="$config_dir/includes"

source "$include_dir/log.sh"

_writeLog 0 "config_dir = $config_dir"
_writeLog 0 "stow_dir = $stow_dir"
_writeLog 0 "dot_config_dir = $dot_config_dir"
_writeLog 0 "target_dir = $target_dir"
echo

source "$include_dir/initialize"
source "$include_dir/install_packages"
source "$include_dir/install_dwm"
source "$include_dir/config_nvim"
source "$include_dir/config_tmux"
source "$include_dir/config_yazi"
source "$include_dir/config_backlight"

initialize
required_fonts="ttf-jetbrains-mono noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji"
install_packages_using_yay "$required_fonts" "--needed"
install_config_dwm "JoelMTom/chadwm.git"
basic_packages="neovim ghostty exa bat firefox zoxide thefuck fzf plymouth zen-browser-bin cmake yazi light clang llvm nodejs npm unzip"
install_packages_using_yay "$basic_packages" "--needed"
config_nvim
config_backlight
rm "$HOME/.bashrc"
copyfile "$config_dir/.bashrc" "$stow_dir"
install_config_tmux
install_config_yazi

install_stow
stow -d ${stow_dir} -t ${target_dir} --dotfiles --ignore='\.*.sh|includes|.git\.*|log' -R .
