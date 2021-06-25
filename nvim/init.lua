vim.g.mapleader = " "

require('_settings') -- neovim options
require('_colorscheme') -- apply colorscheme
require('_mappings') -- keymappings

require('plugins') -- load plugins
require('plugins._compe') -- nvim-compe
require('plugins._kommentary') -- kommentary
require('plugins._treesitter') -- treesitter
require('plugins._diffview') -- git diff viewer

require('_lsp') -- LSP
