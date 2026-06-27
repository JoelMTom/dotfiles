config_dir=${1:-$(pwd)}
stow_dir="${config_dir}"
dot_config_dir="${stow_dir}/dot-config"
target_dir=${2:-$HOME}

source "./includes/log.sh"
source "./includes/utils.sh"

_writeLog 0 "config_dir = ${config_dir}"
_writeLog 0 "stow_dir = ${stow_dir}"
_writeLog 0 "dot_config_dir = ${dot_config_dir}"
_writeLog 0 "target_dir = ${target_dir}"
echo

source "./includes/initialize"
source "./includes/install_packages"
source "./includes/install_dwm"
source "./includes/config_nvim"
source "./includes/config_tmux"
source "./includes/config_backlight"
source "./includes/config_dunst"

initialize
required_fonts="ttf-jetbrains-mono noto-fonts noto-fonts-cjk noto-fonts-extra noto-fonts-emoji ttf-jetbrains-mono-nerd"
install_packages_using_yay "${required_fonts}" "--needed"
install_config_dwm "JoelMTom/chadwm.git" "chadwm"
basic_packages="neovim ghostty exa bat firefox zoxide thefuck fzf impala plymouth zen-browser-bin cmake yazi light clang llvm nodejs npm unzip dunst batify tmux man bluetui bluez bluez-utils gdb tree-sitter-cli qutebrowser ripgrep sesh xclip maim zsh"
install_packages_using_yay "${basic_packages}" "--needed"
config_nvim
config_backlight
config_dunst
config_tmux

install_stow
stow -d "${stow_dir}" -t "${target_dir}" --dotfiles --ignore='\.*.sh|includes|.git\.*|log|nvim' -R .
