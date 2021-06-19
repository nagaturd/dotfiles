#!/bin/zsh

# Default programs:
export EDITOR="nvim"

# Environment variables:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

if [ ! -d "$HOME/.cache/zsh" ]; then
	mkdir -p "$HOME/.cache/zsh"
fi
