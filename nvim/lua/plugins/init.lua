-- Remember to ':so %' or ':luafile %' after saving
-- Then run ':PaqInstall' to install all plugins
local fn = vim.fn

-- Install paq-nvim automatically
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/savq/paq-nvim', install_path})
end

-- Plugins
require 'paq-nvim' {
  'savq/paq-nvim', -- Let Paq manage itself
  -- LSP
  'neovim/nvim-lspconfig', -- config language servers
  'kabouzeid/nvim-lspinstall', -- manage language servers
  'glepnir/lspsaga.nvim', -- better LSP utils
  'ahmedkhalf/lsp-rooter.nvim', -- autochange working dir
  'folke/lua-dev.nvim', -- get autocomplete for nvim lua stuff
  -- Treesitter
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
  'windwp/nvim-ts-autotag', -- autocomplete tags e.g. "<tag></tag>"
  'windwp/nvim-autopairs', -- autocomplete pairs
  -- Comments
  'b3nj5m1n/kommentary', -- commenting
  'joosepalviste/nvim-ts-context-commentstring', -- better comments w/ treesitter
  -- Completion
  'hrsh7th/nvim-compe', -- autocompletion
  'onsails/lspkind-nvim', -- icons for autocomplete menu
  -- Git
  'sindrets/diffview.nvim', -- better git diffs
  -- File explorer
  'kyazdani42/nvim-tree.lua', -- file explorer
  -- UI
  'brikehn/galaxyline.nvim', -- statusline
  -- Icons
  'kyazdani42/nvim-web-devicons', -- devicons
  -- Colors
  'folke/tokyonight.nvim', -- Tokyonight colorscheme
  'norcalli/nvim-colorizer.lua' -- shows colors in nvim 
}
