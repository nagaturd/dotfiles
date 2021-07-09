#!/bin/sh
#
# Source some files
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"

# zshoptions
setopt menucomplete
setopt auto_cd # No need for 'cd' anymore
setopt interactive_comments
stty stop undef # Disable ctrl-s to freeze terminal
zle_highlight=('paste:none')

unsetopt BEEP

# Completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Functions
source "${ZDOTDIR}/zsh-functions"

# Plugins
zsh_add_plugin "zsh-completions"
zsh_add_plugin "zsh-autosuggestions"
zsh_add_plugin "zsh-syntax-highlighting"

# Keybinds
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"
bindkey "^ " autosuggest-accept
bindkey "^\n" autosuggest-execute
bindkey "^[[Z" reverse-menu-complete
