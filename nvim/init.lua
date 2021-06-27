vim.g.mapleader = " "

require('options') -- neovim options
require('mappings') -- keymappings

require('plugins')
require('plugins.nvimtree')
require('plugins.telescope')
require('plugins.lsp-rooter')
require('plugins.tokyonight')
require('plugins.compe')
require('plugins.diffview')
require('plugins.treesitter')
require('plugins.kommentary')
require('plugins.galaxyline')
require('plugins.colorizer')

require('lsp') -- LSP
