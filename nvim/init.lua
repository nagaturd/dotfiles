vim.g.mapleader = ' '

require('options') -- neovim options
require('mappings') -- keymappings

require('plugins')
require('plugins.nvimtree')
require('plugins.telescope')
require('plugins.lsp-rooter')
require('plugins.tokyonight')
require('plugins.compe')
require('plugins.treesitter')
require('plugins.kommentary')
require('plugins.symbols')
require('plugins.galaxyline')
require('plugins.colorizer')
require('plugins.pears')
require('plugins.git')

require('lsp') -- LSP
