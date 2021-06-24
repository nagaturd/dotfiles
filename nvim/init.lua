vim.g.mapleader = " "

require('_settings') -- neovim options
require('_colorscheme') -- apply colorscheme
require('_mappings') -- keymappings
require('_format') -- formatting

require('plugins') -- load plugins
require('plugins._compe') -- nvim-compe
require('plugins._kommentary') -- kommentary
require('plugins._treesitter') -- treesitter

require('_lsp') -- LSP
