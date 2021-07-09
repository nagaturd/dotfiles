#!/bin/sh

### OPTIONS AND VARIABLES ###

# Colors
BLUE="$(tput setaf 4)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"
RED="$(tput setaf 1)"
NONE="$(tput sgr0)"

OS=$(uname -s)
DOTFILES_REPO="https://github.com/brikehn/dotfiles"

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

# Welcome message
welcome() {
  printf "${BLUE}%s${NONE}\n" "
        __       __    ___ __ __             
    .--|  .-----|  |_.'  _|__|  .-----.-----.
  __|  _  |  _  |   _|   _|  |  |  -__|__ --|
 |__|_____|_____|____|__| |__|__|_____|_____|
"
  printf "This is a script that sets up my personal development environment.
${YELLOW}THIS SCRIPT IS FOR FRESH INSTALLATIONS ONLY!!!${NONE}\n"
}

# Setup prompt
setup() {
  read -rp "${BLUE}::${NONE} Would you like to start the setup process? (y/N): " yn
  case $yn in
    [Yy]*) find_os ;;
    *)
      print_msg "Exiting setup..."
      exit
      ;;
  esac
  unset yn
}

# Check if script is run with elevated privileges
is_root() {
  if [ "$EUID" -ne 0 ]; then
    print_error "This script requires elevated privileges."
    exit 1
  fi
}

# Run the proper setup script depending on Linux distribution
find_os() {
  case "${OS}" in
    "Linux")
      is_root
      DISTRO=$(sed -n 's/^NAME=\(.*\)/\1/p' </etc/os-release)
      case "${DISTRO}" in
        *Arch*) sh -c "$(curl -fsSL https://raw.githubusercontent.com/brikehn/dotfiles/main/.config/scripts/bootstrap/os/arch.sh)" ;;
        *Debian*) sh -c "$(curl -fsSL https://raw.githubusercontent.com/brikehn/dotfiles/main/.config/scripts/bootstrap/os/debian.sh)" ;;
        *)
          print_error "Sorry, your Linux distribution is not supported."
          exit 1
          ;;
      esac
      ;;
    "Darwin") sh -c "$(curl -fsSL https://raw.githubusercontent.com/brikehn/dotfiles/main/.config/scripts/bootstrap/os/macos.sh)" ;;
    *)
      print_error "Operating system not supported, exiting..."
      exit 1
      ;;
  esac
}

### MAIN ###

welcome
setup
