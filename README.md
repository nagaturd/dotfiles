### Vim Plugins
- [ALE](https://github.com/dense-analysis/ale) - Linting engine for my linting needs
- [lightline](https://github.com/itchyny/lightline.vim) - A vim statusline plugin
- [NERDTree](https://github.com/preservim/nerdtree) - File system explorer for Vim
- [VimDevIcons](https://github.com/ryanoasis/vim-devicons) - Icons for NERDTree

## Zsh
#### Install `zsh` along with some nice plugins: [zsh-completions](https://github.com/zsh-users/zsh-completions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
```console
sudo pacman -S zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting
```
For more information, visit the [Arch Linux wiki page for zsh](https://wiki.archlinux.org/title/zsh#Installation)

#### Start initial configuration
Set `vi` keybinds and enable completion, leave everything else default
```console
zsh
```

#### Change default shell
```console
chsh -s /usr/bin/zsh
```

#### Initialize plugins
Add these two lines to the end of your `.zshrc` file
```zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

## Starship
#### Install `starship`
```console
sudo pacman -S starship
```

#### Setup config file
```console
mkdir -p ~/.config
ln -s ~/.dotfiles/starship/starship.toml ~/.config
```

#### Start `starship` with shell
Add this line at the end of the file
```zsh
eval "$(starship init zsh)"
```
