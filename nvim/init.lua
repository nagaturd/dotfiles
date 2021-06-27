vim.g.mapleader = " "

require('options') -- neovim options
require('mappings') -- keymappings

require('plugins')
require('plugins.nvimtree')
require('plugins.compe')
require('plugins.kommentary')
require('plugins.treesitter')
require('plugins.diffview')
require('plugins.lsp-rooter')
require('plugins.tokyonight')
require('plugins.galaxyline')
require('plugins.colorizer')

require('lsp') -- LSP
