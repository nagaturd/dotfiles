local fn = vim.fn
local execute = vim.api.nvim_command

-- Install packer automatically
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins/init.lua PackerCompile" 

-- Plugins
require("packer").startup({function(use)
  use 'wbthomason/packer.nvim' -- Let packer manage itself
  -- LSP
  use 'neovim/nvim-lspconfig' -- config language servers
  use 'kabouzeid/nvim-lspinstall' -- manage language servers
  use 'glepnir/lspsaga.nvim' -- better LSP utils
  use 'ahmedkhalf/lsp-rooter.nvim' -- autochange working dir
  use 'folke/lua-dev.nvim' -- nvim lua API completion
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'windwp/nvim-ts-autotag' -- autocomplete tags e.g. "<tag></tag>"
  use 'windwp/nvim-autopairs' -- autocomplete pairs
  -- Telescope
  use 'nvim-lua/popup.nvim' -- dependency for telescope
  use 'nvim-lua/plenary.nvim' -- dependency for telescope
  use 'nvim-telescope/telescope.nvim' -- telescope
  use 'nvim-telescope/telescope-fzy-native.nvim' -- telescope fzy
  use 'nvim-telescope/telescope-project.nvim' -- project management
  -- Snippets
  -- use 'hrsh7th/snippets.nvim' -- snippet plugin
  -- use 'rafamadriz/friendly_snippets' -- community snippets collection
  -- Comments
  use 'b3nj5m1n/kommentary' -- commenting
  use 'joosepalviste/nvim-ts-context-commentstring' -- better comments w/ treesitter
  -- Completion
  use 'hrsh7th/nvim-compe' -- autocompletion
  use 'onsails/lspkind-nvim' -- icons for autocomplete menu
  -- Debugging
  -- use 'mfussenegger/nvim-dap' -- dap client
  -- use 'rcarriga/nvim-dap-ui' -- UI for nvim-dap
  -- Git
  use 'sindrets/diffview.nvim' -- better git diffs
  -- Terminal
  -- use 'akinsho/nvim-toggleterm.lua' -- integrated terminal
  -- File explorer
  use 'kyazdani42/nvim-tree.lua' -- file explorer
  -- Tab/Statusline
  use 'brikehn/galaxyline.nvim' -- statusline
  -- use 'romgrk/barbar.nvim' -- tabline
  -- Icons
  use 'kyazdani42/nvim-web-devicons' -- devicons
  -- Colors
  use 'folke/tokyonight.nvim' -- Tokyonight colorscheme
  use 'norcalli/nvim-colorizer.lua' -- shows colors in nvim
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({border = 'single' })
    end
  }
}})
