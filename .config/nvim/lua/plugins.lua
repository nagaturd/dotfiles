local fn = vim.fn
local execute = vim.api.nvim_command

-- Install packer automatically
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua source plugins.lua | PackerCompile'

-- Plugins
require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim' -- Let packer manage itself
    -- LSP
    use 'neovim/nvim-lspconfig' -- config language servers
    use 'kabouzeid/nvim-lspinstall' -- manage language servers
    use 'glepnir/lspsaga.nvim' -- better LSP utils
    use 'ahmedkhalf/lsp-rooter.nvim' -- autochange working dir
    use 'simrat39/symbols-outline.nvim' -- symbols sidebar
    use 'ray-x/lsp_signature.nvim' -- show signatures
    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/playground'
    use 'windwp/nvim-autopairs' -- autopairing
    use 'windwp/nvim-ts-autotag' -- autotagging
    -- Telescope
    use 'nvim-lua/popup.nvim' -- dependency for telescope
    use 'nvim-lua/plenary.nvim' -- dependency for telescope
    use 'nvim-telescope/telescope.nvim' -- telescope
    use 'nvim-telescope/telescope-fzy-native.nvim' -- telescope fzy
    -- Snippets
    use 'L3MON4D3/LuaSnip' -- snippet plugin
    use 'rafamadriz/friendly-snippets' -- community snippets collection
    -- Comments
    use 'b3nj5m1n/kommentary' -- commenting
    use 'joosepalviste/nvim-ts-context-commentstring' -- contextual commenting
    -- Completion
    use 'hrsh7th/nvim-compe' -- autocompletion
    -- Debugging
    -- use 'mfussenegger/nvim-dap' -- dap client
    -- use 'rcarriga/nvim-dap-ui' -- UI for nvim-dap
    -- Terminal
    use 'akinsho/nvim-toggleterm.lua' -- integrated terminal
    -- Git
    use 'lewis6991/gitsigns.nvim' -- git in sign column
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
  end
})
