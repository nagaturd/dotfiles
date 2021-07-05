vim.g.mapleader = ' '

require('options') -- neovim options
require('mappings') -- keymappings

require('plugins')
require('plugins.lspsaga')
require('plugins.lspinstall')
require('plugins.lsp-rooter')
require('plugins.nvimtree')
require('plugins.telescope')
require('plugins.tokyonight')
require('plugins.compe')
require('plugins.treesitter')
require('plugins.kommentary')
require('plugins.symbols')
require('plugins.galaxyline')
require('plugins.colorizer')
require('plugins.autopairs')
require('plugins.autotags')
require('plugins.gitsigns')

require('lsp') -- LSP
