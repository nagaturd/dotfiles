-- Remember to ':so %' or ':luafile %' after saving
-- Then run ':PaqInstall' to install all plugins
local fn = vim.fn

-- Install paq-nvim automatically
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.cmd('!git clone https://github.com/savq/paq-nvim ' .. install_path)
end

-- Plugins
require 'paq-nvim' {
  'savq/paq-nvim', -- Let Paq manage itself
  -- LSP
  'neovim/nvim-lspconfig', -- config language servers
  'kabouzeid/nvim-lspinstall', -- manage language servers
  'glepnir/lspsaga.nvim', -- better LSP utils
  'ahmedkhalf/lsp-rooter.nvim', -- autochange working dir
  'folke/lua-dev.nvim', -- nvim lua API completion
  -- Treesitter
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
  'windwp/nvim-ts-autotag', -- autocomplete tags e.g. "<tag></tag>"
  'windwp/nvim-autopairs', -- autocomplete pairs
  -- Telescope
  'nvim-lua/popup.nvim', -- dependency for telescope
  'nvim-lua/plenary.nvim', -- dependency for telescope
  'nvim-telescope/telescope.nvim', -- telescope
  {
    'nvim-telescope/telescope-fzy-native.nvim',
    run = 'git submodule update --init --recursive'
  }, -- telescope fzy
  'nvim-telescope/telescope-project.nvim', -- project management
  -- Snippets
  -- 'hrsh7th/snippets.nvim', -- snippet plugin
  -- 'rafamadriz/friendly_snippets', -- community snippets collection
  -- Comments
  'b3nj5m1n/kommentary', -- commenting
  'joosepalviste/nvim-ts-context-commentstring', -- better comments w/ treesitter
  -- Completion
  'hrsh7th/nvim-compe', -- autocompletion
  'onsails/lspkind-nvim', -- icons for autocomplete menu
  -- Debugging
  -- 'mfussenegger/nvim-dap', -- dap client
  -- 'rcarriga/nvim-dap-ui', -- UI for nvim-dap
  -- Git
  'sindrets/diffview.nvim', -- better git diffs
  -- Terminal
  -- 'akinsho/nvim-toggleterm.lua', -- integrated terminal
  -- File explorer
  'kyazdani42/nvim-tree.lua', -- file explorer
  -- Tab/Statusline
  'brikehn/galaxyline.nvim', -- statusline
  -- 'romgrk/barbar.nvim', -- tabline
  -- Icons
  'kyazdani42/nvim-web-devicons', -- devicons
  -- Colors
  'folke/tokyonight.nvim', -- Tokyonight colorscheme
  'norcalli/nvim-colorizer.lua' -- shows colors in nvim
}
