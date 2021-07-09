# Dotfiles
These are my dotfiles, take 'em or leave 'em.

# Bootstrapping

Included is a bootstrap script to make the initial setup process easier on a new machine.

Follow the directions for your operating system as shown below.

```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/brikehn/dotfiles/main/.config/scripts/bootstrap/install.sh)"
```
**Arch Linux:** Run as `root`

**macOS:** Run as user

## What does it do?

### For new setups:
- Set a root password (only on Arch Linux)
- Set up a new user (only on Arch Linux)
- Install [packages](#Packages)
- Install an AUR helper ([yay](https://github.com/Jguer/yay) only on Arch Linux)
- Install [dotfiles](https://github.com/brikehn/dotfiles) and manage with [yadm](https://yadm.io)

### Packages
- zsh - for a better shell experience
- [zsh-completions](https://github.com/zsh-users/zsh-completions) - additional completion definitions for zsh
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - suggests commands as you type
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - syntax highlighting for zsh
- [starship](https://starship.rs) - a shell prompt; compatible with zsh, written in [Rust](https://rust-lang.org)
- [neovim](https://neovim.io) - hyperextensible Vim-based text editor
- [tmux](https://github.com/tmux/tmux) - terminal multiplexer
- [nodejs](https://nodejs.org) - JavaScript runtime
- [npm](https://www.npmjs.com/) - Node package manager
- [git](https://git-scm.com/) - version control
- unzip - unzip compressed files
- [ripgrep](https://github.com/BurntSushi/ripgrep) - grep search tool
- [fzy](https://github.com/jhawthorn/fzy) - fuzzy finder

# Dotfiles
To manually install dotfiles:
```console
# Install 'yadm'
# Arch Linux: sudo yay -S yadm
# macOS: brew install yadm
yadm clone https://github.com/brikehn/dotfiles
```

To update dotfiles:
```console
yadm pull
```

To manually run the bootstrapper:
```console
yadm bootstrap
```

# Git
```console
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global credential.helper store
```
_Should probably figure out a more secure way to store my git credentials
but this works for now..._

# Fonts
A Nerd Font is recommended to get the extended icons support needed to display things properly.

You can find the fonts I use from the links provided below or use one of the pre-installed fonts located in the `.config/fonts` folder.

| Font | Link |
| ---- | -------- |
| mononoki Nerd Font | [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip) |
| Hack Nerd Font | [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip) |
| JetBrainsMono Nerd Font | [Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip) |

Note: For Windows Terminal, the italics don't work correctly with the mononoki Nerd Font above. Instead, use my [custom patched version of mononoki Nerd Font](https://github.com/brikehn/dotfiles/tree/main/.config/fonts/Mononoki).

# Neovim
## Language Servers
Neovim 0.5+ has a built-in LSP client that allows for language features such as
go-to-definition, find-references, hover, completion, rename, format, refactor, etc.,
using semantic whole-project analysis

My dotfiles includes [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
which handles configuration and launching of the language servers.

To install additional language servers, run `:LspInstall <language>` provided by [kabouzeid/nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall).
You can see the supported language installers on the [kabouzeid/nvim-lspinstall repo](https://github.com/kabouzeid/nvim-lspinstall#bundled-installers).

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

### Configuring additional language servers
Configuring the pre-installed language servers can be done by editing the language files found 
in `~/.config/nvim/lua/config/lsp/` or adding new ones for missing languages.

You can find details on configuration settings for each supported language from
neovim/nvim-lspconfig's [CONFIG.md](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md).

## Formatting and Linting
Some language servers come with built-in formatting but if not you can still get formatting using `efm` language server.

This is useful if you also want to use other formatting providers, such as Prettier rather than the built-in formatting.

For configuring `efm` formatting add filetypes you want formatting for in `~/.config/nvim/lua/lsp/efm.lua` and then configure the formatter using the existing one as examples.

### Format on save
Add this for each language you want formatting on save in `~/.config/nvim/lua/lsp/init.lua`
```lua
autocmd BufWritePre *.<ext> lua vim.lsp.buf.formatting_sync(nil, 100)
```

Formatters must be individually installed (e.g. prettier, lua-format, shfmt, etc.). 

### Installed Formatters/Linters
| Language    | Formatter/Linter           |
| :---------- | :----------                |
| lua         | lua-format                 |
| bash        | shfmt, shellcheck          |
| javascript, javascriptreact, typescript, typescriptreact | typescript-language-server (built-in) |

# Terminal Emulators

### Recommendations
| OS | Terminal |
| --- | --- |
| Windows | **Windows Terminal**, [alacritty](https://github.com/alacritty/alacritty) |
| macOS | [**alacritty**](https://github.com/alacritty/alacritty), iTerm 2 |
| Linux | [alacritty](https://github.com/alacritty/alacritty), [kitty](https://sw.kovidgoyal.net/kitty) |

**bold** - current

----
#### Inspired by [LARBS](https://larbs.xyz) and [pwyde/dotfiles](https://github.com/pwyde/dotfiles)
