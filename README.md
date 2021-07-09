# Dotfiles
These are my dotfiles, take 'em or leave 'em.

# Installation

To install, run:
```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/brikehn/dotfiles/main/.config/scripts/bootstrap/install.sh)"
```

_There are some prompts at the beginning for initial setup._

### What does it do?
- Set a root password
- Set up a new user
- Install packages
- Install an AUR helper ([yay](https://github.com/Jguer/yay))
- Install [dotfiles](https://github.com/brikehn/dotfiles) and manage with [yadm](https://yadm.io).

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

# Post-Installation
## Git
```console
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global credential.helper store
```
*Should probably figure out a more secure way to store my git credentials
but this works for now...*

## Fonts
Currently, the font I'm using is mononoki patched with Nerd Fonts (specifically the Mono variant) since I've found it to work best for my current setup - especially with Windows Terminal which is my current terminal emulator. I'm not sure how things look in other terminals with other fonts but my other go to fonts include Hack and JetBrainsMono which can both be found in my [fonts](https://github.com/brikehn/dotfiles/tree/main/.config/fonts).

## Install language servers
Neovim 0.5+ has a built-in LSP client that allows for language features such as
go-to-definition, find-references, hover, completion, rename, format, refactor, etc.,
using semantic whole-project analysis

My dotfiles includes [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
which handles configuration and launching of the language servers.

To install additional language servers, run `:LspInstall <language>` provided by [kabouzeid/nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall).
You can see the supported language installers on the [kabouzeid/nvim-lspinstall repo](https://github.com/kabouzeid/nvim-lspinstall#bundled-installers).

**Installed Language Servers:**
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

#### Languages installed and configured:
| Language    | Formatter                  |
| :---------- | :----------                |
| lua         | lua-format                 |
| bash        | shfmt, shellcheck          |
| javascript, javascriptreact, typescript, typescriptreact | typescript-language-server (built-in) |
----
#### Inspired by [LARBS](https://larbs.xyz) and [pwyde/dotfiles](https://github.com/pwyde/dotfiles)
