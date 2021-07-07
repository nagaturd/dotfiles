#!/bin/sh

### VARIABLES & CONSTANTS ###

OS=$(uname -s)
USER=$(id -u -n)

## Colors
BLUE="$(tput setaf 4)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"
RED="$(tput setaf 1)"
NONE="$(tput sgr0)"

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
  echo -e "${GREEN}=>${NONE}" "${@}" >&1
}

print_error() {
  echo -e "${RED}=> ERROR:${NONE}" "${@}" >&2
}

pac_install() {
  print_msg "Updating package database..."
  sudo pacman -Syyu --noconfirm
  print_msg "Installing packages..."
  sudo pacman -S --needed --noconfirm "${pkg_list[@]}"
}

aur_install() {
  print_msg "Installing AUR packages..."
  yay -S --needed --noconfirm "${aur_pkg_list[@]}"
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

goodbye() {
  print_msg "${YELLOW}Logout${NONE} then ${YELLOW}login${NONE} to see your new configuration!"
}

### MAIN ###

pac_install
aur_install
bootstrap_zsh
bootstrap_neovim
cleanup
goodbye
