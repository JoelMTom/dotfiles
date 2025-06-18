#! /usr/bin/env bash

# Install stow
install_stow() {
  install_packages_using_pacman "stow" "--needed"
}

# Function to make dir
makedir() {
  dir="$1"
  if [[ ! -d "$dir" ]]; then
    mkdir -p $dir
  fi
}

# Function to clone a git url
clone_using_git() {
  # echo "$*"
  git_url=${1}
  clone_dir=${2}
  repo_name=${3}
  flags=${4}
  makedir ${clone_dir}
  cd ${clone_dir}
  declare -a arguments
  arguments=(${git_url} ${flags} ${arguments} ${repo_name})
  if [[ ! -d ${repo_name} ]]; then
    _writeLog 0 "Cloning ${git_url} into ${clone_dir}/${repo_name}"
    git clone "${arguments[@]}"
    _writeLog 1 "Cloning Successful"
  else
    _writeLog 0 "${repo_name} already exists!"
  fi
  echo
}

# Function to move dir
movedir() {
  from_dir="$1"
  to_dir="$2"
  makedir "$from_dir"
  makedir "$to_dir"
  _writeLog 0 "Moving $from_dir to $to_dir"
  mv "$from_dir" "$to_dir"
}

# Function to copy file
copyfile() {
  file_to_move="$1"
  to_dir="$2"
  makedir "$to_dir"
  if [[ -f "$file_to_move" ]]; then
    _writeLog 0 "Moving $file_to_move file to $to_dir"
    cp "$file_to_move" "$to_dir"
  fi
}

#Function to copy files
copyfiles() {
  files_dir="$1"
  to_dir="$2"
  makedir "$to_dir"
  if [[ -d "$files_dir" ]]; then
    _writeLog 0 "Moving $files_dir file to $to_dir"
    cp -r "$files_dir" "$to_dir"
  fi
}
