#!/bin/sh

### VARIABLES & CONSTANTS ###

# Colors
BLUE="$(tput setaf 4)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"
RED="$(tput setaf 1)"
NONE="$(tput sgr0)"

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

# Installs a package manager
install_brew() {
  [ -f "/usr/local/bin/brew" ] || (
    print_msg "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  )
}

bootstrap_yadm() {
  print_msg "Installing yadm..."
  brew install yadm
  yadm clone --bootstrap "${DOTFILES_REPO}"
}

finalize() {
  printf "${BLUE}Setup is now complete!${NONE}\n"
}

### MAIN ###

install_brew
bootstrap_yadm
finalize
