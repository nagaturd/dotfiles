# Dotfiles
These are my dotfiles, take 'em or leave 'em.

# Pre-Installation

Included is a bootstrap script to make the initial setup process easier on a new machine.

Follow the directions for your operating system as shown below.

```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/brikehn/dotfiles/main/.config/scripts/bootstrap/install.sh)"
```
**Arch Linux:** Run as `root`

**macOS:** Run as user

### What does it do?
- Set a root password (only on Arch Linux)
- Set up a new user (only on Arch Linux)
- Install [**packages**](https://github.com/brikehn/dotfiles#Packages)
- Install an AUR helper ([**yay**](https://github.com/Jguer/yay) only on Arch Linux)
- Install [**dotfiles**](https://github.com/brikehn/dotfiles) and manage with [**yadm**](https://yadm.io)

### Packages
- **zsh** - for a better shell experience
- [**zsh-completions**](https://github.com/zsh-users/zsh-completions) - additional completion definitions for zsh
- [**zsh-autosuggestions**](https://github.com/zsh-users/zsh-autosuggestions) - suggests commands as you type
- [**zsh-syntax-highlighting**](https://github.com/zsh-users/zsh-syntax-highlighting) - syntax highlighting for zsh
- [**starship**](https://starship.rs) - a shell prompt; compatible with zsh, written in [Rust](https://rust-lang.org)
- [**neovim**](https://neovim.io) - hyperextensible Vim-based text editor
- [**tmux**](https://github.com/tmux/tmux) - terminal multiplexer
- [**nodejs**](https://nodejs.org) - JavaScript runtime
- [**npm**](https://www.npmjs.com/) - Node package manager
- [**git**](https://git-scm.com/) - version control
- **unzip** - unzip compressed files
- [**ripgrep**](https://github.com/BurntSushi/ripgrep) - grep search tool
- [**fzy**](https://github.com/jhawthorn/fzy) - fuzzy finder
- and more...

# Installation
These dotfiles are managed by [**yadm (Yet Another Dotfiles Manager)**](https://yadm.io/)

### Arch Linux
```console
yay -S yadm
```

### macOS
```console
brew install yadm
```

### Manual
```
git clone https://github.com/TheLocehiliosan/yadm.git $HOME/.local/share/yadm
mkdir -p $HOME/.local/bin; ln -s $HOME/.local/share/yadm/yadm $HOME/.local/bin/yadm
```

## YADM
### Install
```console
yadm clone https://github.com/brikehn/dotfiles
```
### Update
```console
yadm pull
```
### Bootstrap
```console
yadm bootstrap
```
### Encrypt
If you store encrypted files, you can decrypt them after installing your dotfiles by using
```console
yadm decrypt
```

To add encrypted files, edit `.config/yadm/encrypt` and add the files you want to encrypt (same format as `.gitignore` files)
```console
yadm encrypt
```

And make sure you add `.local/share/yadm/archive` to your repository
```console
yadm add .local/share/yadm/archive
```

For more info, visit the [**yadm documentation**](https://yadm.io/docs/overview)

# Additional Info
## Git
Update git config with your own information ([**git-config documentation**](https://git-scm.com/docs/git-config))
```console
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

You can store your git credentials to skip entering your password each time you push changes to a git remote ([**gitcredentials documentation**](https://git-scm.com/docs/gitcredentials))

**This method is not recommended because it stores your git credentials in plaintext in `~/.git-credentials`**
```console
git config --global credential.helper store
```

Another method is to use SSH keys combined with [**yadm encryption**](https://yadm.io/docs/encryption) for storing those keys in an encrypted format ([**GitHub SSH Setup**](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh))

For macOS, you can also use `osxkeychain` as your `credential.helper`
```console
git config --global credential.helper osxkeychain
```

For more information, visit the [**Git documentation**](https://git-scm.com/docs)

## Fonts
A Nerd Font is recommended to get the extended icons support needed to display things properly.

You can download fonts from [**nerdfonts.com**](https://www.nerdfonts.com/font-downloads) or use one of the pre-installed Nerd Fonts located in the `.config/fonts` folder.

**Here are some of the fonts I use:**
| Font | Link |
| ---- | -------- |
| mononoki Nerd Font | [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip) |
| Hack Nerd Font | [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip) |
| JetBrainsMono Nerd Font | [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip) |

**Note:** For Windows Terminal, the italics don't work correctly with the mononoki Nerd Font above. Instead, use my [**custom patched version of mononoki Nerd Font**](https://github.com/brikehn/dotfiles/tree/main/.config/fonts/Mononoki).

## Neovim
### Language Servers
[**Neovim**](https://neovim.io/) 0.5+ has a built-in LSP client that allows for language features such as
go-to-definition, find-references, hover, completion, rename, format, refactor, etc.,
using semantic whole-project analysis

My dotfiles includes [**neovim/nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig), a plugin
which handles configuration and launching of installed language servers.

### Installed language servers
* efm
* lua
* bash
* graphql
* cpp (includes c and obj-c)
* typescript (includes javascript and react variants)
* python
* dockerfile
* html
* css
* json
* rust
* svelte
* vim
* yaml

To install additional language servers, run `:LspInstall <language>` provided by [**kabouzeid/nvim-lspinstall**](https://github.com/kabouzeid/nvim-lspinstall).
You can see the supported language installers on the [**kabouzeid/nvim-lspinstall repo**](https://github.com/kabouzeid/nvim-lspinstall#bundled-installers).

### Configuring language servers
Configuring language servers can be done by editing the language files found 
in `~/.config/nvim/lua/config/lsp/` or adding new ones for missing languages.

You can find details on configurating each supported language from neovim/nvim-lspconfig's [**CONFIG.md**](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md).

### Formatting and Linting
Some language servers come with built-in formatting but if not you can still get formatting using a general purpose language server such as `efm`.

This is useful if you also want to use other formatting providers, such as Prettier rather than built-in formatters.

For configuring `efm` formatting, add filetypes you want formatting for in `~/.config/nvim/lua/lsp/efm.lua` and then configure the formatter using the existing ones as examples.

### Format on save
Add this for each language you want formatting on save in `~/.config/nvim/lua/lsp/init.lua`
```lua
autocmd BufWritePre *.<ext> lua vim.lsp.buf.formatting_sync(nil, 100)
```

Formatters must be individually installed (e.g. prettier, lua-format, shfmt, etc.). 

### Installed Formatters/Linters
| Language    | Formatter/Linter           |
| ----------- | -----------                |
| lua         | lua-format                 |
| bash        | shfmt, shellcheck          |
| javascript, javascriptreact, typescript, typescriptreact | typescript-language-server (built-in) |

## Docker
[**Docker**](https://docs.docker.com/engine/) and [**docker-compose**](https://docs.docker.com/compose/) are installed by the bootstrap process.

**My docker workflow in WSL:**

Create a new tmux session
```console
tmux new -s docker
```

Start docker daemon
```console
sudo dockerd
```

<kbd>Ctrl + a</kbd> <kbd>d</kbd> to detach from tmux session

For more information, see the [**Docker documentation**](https://docs.docker.com/)

**Note:** There are other ways to [**run docker in WSL**](https://docs.docker.com/docker-for-windows/wsl/) - with [**Docker Desktop for Windows**](https://docs.docker.com/docker-for-windows/install/) or using a systemd bottle ([**subsystemctl**](https://github.com/sorah/subsystemctl) 
or [**genie**](https://github.com/arkane-systems/genie)) - but I found my method the simplest to setup since I already utilize tmux in my workflow.

## Tmux
<kbd>Ctrl + b</kbd> prefix is remapped to <kbd>Ctrl + a</kbd> because I think it's easier to input.

### Vim-Like Keybinds

**Navigate Panes**

Keybind | Action
--------|-------
<kbd>Ctrl + a</kbd> <kbd>h</kbd> | move one pane to the left
<kbd>Ctrl + a</kbd> <kbd>j</kbd> | move one pane to the bottom
<kbd>Ctrl + a</kbd> <kbd>k</kbd> | move one pane to the top
<kbd>Ctrl + a</kbd> <kbd>l</kbd> | move one pane to the right

**Resize Panes**

Keybind | Action
--------|-------
<kbd>Ctrl + a</kbd> <kbd><</kbd> | decrease pane width
<kbd>Ctrl + a</kbd> <kbd>></kbd> | increase pane width
<kbd>Ctrl + a</kbd> <kbd>-</kbd> | decrease pane height
<kbd>Ctrl + a</kbd> <kbd>+</kbd> | increase pane height
  
For more information, read the [**tmux wiki**](https://github.com/tmux/tmux/wiki)

For an overview of tmux commands, visit [**tmuxcheatsheet.com**](https://tmuxcheatsheet.com)

## Terminal Emulators

### Recommendations
| OS | Terminal |
| --- | --- |
| Windows | **Windows Terminal**, [alacritty](https://github.com/alacritty/alacritty) |
| macOS | [**alacritty**](https://github.com/alacritty/alacritty), iTerm 2 |
| Linux | [alacritty](https://github.com/alacritty/alacritty), [kitty](https://sw.kovidgoyal.net/kitty) |

**bold** - what I currently use

----
#### Inspired by [**LARBS**](https://larbs.xyz) and [**pwyde/dotfiles**](https://github.com/pwyde/dotfiles)
