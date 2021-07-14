#!/bin/sh

### VARIABLES & CONSTANTS ###

# Colors
BLUE="$(tput setaf 4)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"
RED="$(tput setaf 1)"
NONE="$(tput sgr0)"

AUR_HELPER="yay"
DOTFILES_REPO="https://github.com/brikehn/dotfiles"

# List of packages to install with pacman
pkg_list=(
  "base-devel"
  "pacman-contrib"
  "git"
)

### FUNCTIONS ###

print_msg() {
  printf "${GREEN}=>${NONE} %s\n" "${@}" >&1
}

print_warn() {
  printf "${YELLOW}=>${NONE} %s\n" "${@}" >&1
}

print_error() {
  printf "${RED}=> ERROR:${NONE} %s\n" "${@}" >&2
}

# Set root password
setup_root() {
  print_msg "Setting password for 'root'..."
  if [ $(passwd -S root | cut -d " " -f2) == "P" ]; then
    print_msg "Password is already set for 'root', skipping..."
  else
    until passwd; do
      print_warn "Failed to set 'root' password. Try again."
    done
  fi
}

# Create a new user and add to sudoers group
setup_user() {
  print_msg "Creating a new user..."
  read -rp "${BLUE}::${NONE} Set a username: " username
  until useradd -m -G wheel -s /bin/bash "${username}"; do
    print_warn "Failed to set username. Try again."
    read -rp "${BLUE}::${NONE} Set a username: " username
  done

  print_msg "Setting a password for '${username}'..."
  until passwd "${username}"; do
    print_warn "Failed to set password. Try again."
  done
}

# Add 'wheel' group to sudo privileges
assign_sudo() {
  print_msg "Assigning sudo privileges..."
  echo "%wheel ALL=(ALL) ALL" >/etc/sudoers.d/wheel
}

# Initialize Arch keyring
initialize_keys() {
  print_msg "Initializing Arch keyring..."
  pacman-key --init && pacman-key --populate
}

# Rank mirrors by speed
update_mirrors() {
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
  curl -s "https://archlinux.org/mirrorlist/?country=US&protocol=https&ip_version=4&use_mirror_status=on" \
    | sed -e 's/^#Server/Server/' -e '/^#/d' \
    | rankmirrors -n 5 /etc/pacman.d/mirrorlist.backup >/etc/pacman.d/mirrorlist
}

# Install required dependencies
install_pkgs() {
  print_msg "Updating package database..."
  pacman -Syyu --noconfirm

  print_msg "Installing necessary dependencies for setup..."
  # Remove 'fakeroot-tcp' if running in WSL
  if grep -q WSL /proc/version; then
    print_msg "Removing fakeroot-tcp..."
    pacman -Qq | grep -qw fakeroot-tcp && pacman --noconfirm -Rsc fakeroot-tcp
  fi

  pacman -S --needed --noconfirm "${pkg_list[@]}"
}

# Installs an AUR helper
install_helper() {
  [ -f "/usr/bin/${AUR_HELPER}" ] || (
    cd /tmp
    print_msg "Installing ${AUR_HELPER}..."
    git clone https://aur.archlinux.org/"${AUR_HELPER}".git
    chown "${username}":wheel "${AUR_HELPER}"
    cd "${AUR_HELPER}"
    sudo -u "${username}" makepkg --noconfirm -si
  )
}

# Allow sudo with NOPASSWD for running makepkg within script
enable_sudo_nopasswd() {
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/wheel
}

# Reset NOPASSWD setting
disable_sudo_nopasswd() {
  echo "%wheel ALL=(ALL) ALL" >/etc/sudoers.d/wheel
}

bootstrap_yadm() {
  print_msg "Installing yadm..."
  sudo -u "${username}" yay -S --needed --noconfirm yadm
  sudo -u "${username}" 'yadm clone --bootstrap "${DOTFILES_REPO}"' "${username}"
}

finalize() {
  print_msg "Switching users..."
  sudo -u "${username}" printf "${BLUE}Setup is now complete!${NONE}\n"
  su - "${username}"
}

### MAIN ###

setup_root
setup_user
assign_sudo
initialize_keys
install_pkgs
enable_sudo_nopasswd
install_helper
bootstrap_yadm
disable_sudo_nopasswd
finalize
