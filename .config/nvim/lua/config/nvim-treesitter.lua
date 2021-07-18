require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained', -- autoinstall maintained languages
  ignore_install = {},
  highlight = { enable = true, disable = {} },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm'
    },
    indent = { enable = true },
    autotag = { enable = true },
    autopairs = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false }
  }
}
