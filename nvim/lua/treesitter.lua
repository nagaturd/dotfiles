require'nvim-treesitter.config'.setup {
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
    },
	indent = {
		enable = true
	},
  },
}

vim.opt.foldmethod = "expr";
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
