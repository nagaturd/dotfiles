local fn = vim.fn

-- Install paq-nvim automatically
local install_path = fn.stdpath('data')..'/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git','clone','https://github.com/savq/paq-nvim',install_path})
end

-- Remove unlisted plugins and install plugins
vim.cmd("autocmd BufWritePost plugins.lua paqInstallAndClean")
function paqInstallAndClean()
	PaqClean
	PaqInstall
end

-- Plugins
require 'paq-nvim' {
    'savq/paq-nvim'; -- Let Paq manage itself
    
    -- LSP
    'neovim/nvim-lspconfig' -- native LSP
    'kabouzeid/nvim-lspinstall' -- manage language servers

    -- Colors
    'arcticicestudio/nord-vim'; -- Nord Vim colorscheme
}
