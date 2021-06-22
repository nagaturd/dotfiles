-- lspkind
require'lspkind'.init({
	with_text = true,
	symbol_map = {
		Text = '',
		Method = 'ƒ',
		Function = '',
		Constructor = '',
		Variable = '',
		Class = '',
		Interface = 'ﰮ',
		Module = '',
		Property = '',
		Unit = '',
		Value = '',
		Enum = '了',
		Keyword = '',
		Snippet = '﬌',
		Color = '',
		File = '',
		Folder = '',
		EnumMember = '',
		Constant = '',
		Struct = ''
    },
})

-- lspinstall
local function setup_servers()
	require'lspinstall'.setup()
	local servers = require'lspinstall'.installed_servers()
	for _, server in pairs(servers) do
        -- use custom config options if available
        local config
        if pcall(require, 'lsp/'..server) then
            config = require('lsp/'..server)
        else
            config = {}
        end
		require'lspconfig'[server].setup(config)
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  	setup_servers() -- reload installed servers
  	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
