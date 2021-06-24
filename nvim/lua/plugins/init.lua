local fn = vim.fn

-- Install paq-nvim automatically
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/savq/paq-nvim', install_path})
end

vim.cmd('autocmd BufWritePost init.lua PaqInstall')

-- Plugins
require 'paq-nvim' {
  'savq/paq-nvim', -- Let Paq manage itself
  -- LSP
  'neovim/nvim-lspconfig', -- config language servers
  'kabouzeid/nvim-lspinstall', -- manage language servers
  -- Treesitter
  {'nvim-treesitter/nvim-treesitter', run = fn[':TSUpdate']},
  -- 'windwp/nvim-ts-autotag'; -- autocomplete tags e.g. "<tag></tag>"

  -- Comments
  'b3nj5m1n/kommentary', -- commenting
  'joosepalviste/nvim-ts-context-commentstring', -- sets `commentstring` based on cursor location

  -- Formatting
  'mhartington/formatter.nvim', -- formatting in neovim
  -- Autocomplete
  'hrsh7th/nvim-compe', -- completion
  'onsails/lspkind-nvim', -- icons in completion menu
  -- Colors
  'arcticicestudio/nord-vim' -- Nord Vim colorscheme
}
