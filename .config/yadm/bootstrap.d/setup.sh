#!/bin/sh

### VARIABLES & CONSTANTS ###

git_host="github.com"
git_user="brikehn"
git_repo="dotfiles"
git_url="https://${git_host}/${git_user}/"

OS=$(uname -s)
USER=$(id -u -n)

## Colorize output.
# shellcheck disable=SC2034
red="\033[91m"
# shellcheck disable=SC2034
green="\033[92m"
# shellcheck disable=SC2034
blue="\033[94m"
# shellcheck disable=SC2034
yellow="\033[93m"
# shellcheck disable=SC2034
white="\033[97m"
# shellcheck disable=SC2034
no_color="\033[0m"

# Set XDG directories.
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# Set Zsh configuration directory.
export ZDOTDIR="${HOME}/.config/zsh"

pkg_list=(
  "git"
  "zsh"
  "zsh-completions"
  "zsh-syntax-highlighting"
  "starship"
  "tmux"
  "neovim"
  "nodejs"
  "npm"
  "unzip"
  "ripgrep"
  "fzy"
  "shfmt"
)

aur_pkg_list=(
  "lua-format"
)

### FUNCTIONS ###

print_msg() {
  echo -e "${green}=>${no_color}${white}" "${@}" "${no_color}" >&1
}

print_error() {
  echo -e "${red}=> ERROR:${no_color}${white}" "${@}" "${no_color}" >&2
}

pac_install() {
  print_msg "Updating package database..."
  sudo pacman -Syyu --noconfirm
  print_msg "Installing packages..."
  sudo pacman -S --needed --noconfirm "${pkg_list[@]}"
}

aur_install() {
  print_msg "Installing AUR packages..."
  sudo pacman -S --needed --noconfirm "${aur_pkg_list[@]}"
}

install_pkgs() {
  [ -f "/etc/os-release" ] && source /etc/os-release
  case "${NAME}" in
    *Arch*)
      print_msg "System identified as Arch Linux..."
      pac_install
      ;;
    *)
      print_error "Unable to identify operating system! Could not install packages..."
      exit 1
      ;;
  esac
}

bootstrap_zsh() {
  print_msg "Bootstrapping Zsh..."
  print_msg "Setting Zsh as default shell..."
  # Set default shell to Zsh.
  sudo chsh -s /bin/zsh "${USER}"
}

bootstrap_neovim() {
  print_msg "Bootstrapping Neovim..."
  print_msg "Installing Neovim plugin manager..."
  [ ! -d "${XDG_DATA_HOME}/nvim/site/pack/packer/start/packer.nvim" ] \
    && git clone https://github.com/wbthomason/packer.nvim \
      "${XDG_DATA_HOME}/nvim/site/pack/packer/start/packer.nvim"
  print_msg "Installing Neovim plugins..."
  nvim -c "packadd packer.nvim" -u \
    "${XDG_CONFIG_HOME}/nvim/lua/plugins/init.lua" +PackerInstall
}

cleanup() {
  print_msg "Cleaning up files..."
  yadm update-index --assume-unchanged "${HOME}/README.md" "${HOME}/LICENSE"
  rm -f "${HOME}/README.md" "${HOME}/LICENSE"
}

### MAIN ###

install_pkgs
bootstrap_zsh
bootstrap_neovim
cleanup
