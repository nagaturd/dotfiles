vim.g.mapleader = ' '

require('options') -- neovim options
require('mappings') -- keymappings
require('plugins')

require('config.lspsaga')
require('config.nvimtree')
require('config.telescope')
require('config.tokyonight')
require('config.compe')
require('config.treesitter')
require('config.kommentary')
require('config.symbols')
require('config.galaxyline')
require('config.colorizer')
require('config.autopairs')
require('config.autotags')
require('config.gitsigns')
require('config.lsp')
