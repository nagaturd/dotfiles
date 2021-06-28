-- Remember to install language parsers with ':TSInstall <language>'
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
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
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
      config = {
        javascript = {
          __default = '// %s',
          jsx_element = '{/* %s */}',
          jsx_fragment = '{/* %s */}',
          jsx_attribute = '// %s',
          comment = '// %s'
        }
      }
    }
  }
}
