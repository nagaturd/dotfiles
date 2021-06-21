-- npm install -g bash-language-server
require'lspconfig'.bashls.setup {
	filetypes = { "sh", "zsh" }
}
