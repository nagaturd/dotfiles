require'nvim-treesitter.configs'.setup {
  highlight = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    },
    indent = {enable = true},
    autotag = {enable = true},
    context_commentstring = {enable = true, enable_autocmd = false}
  }
}

-- autotags
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = {spacing = 5, severity_limit = 'Warning'},
      update_in_insert = true
    })

-- autopairs
require('nvim-autopairs').setup({enable_check_bracket_line = false})

local map = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

map('i', '<CR>', 'v:lua.MUtils.completion_confirm()',
    {expr = true, noremap = true})

npairs.setup({
  check_ts = true,
  ts_config = {lua = {'string'}, javascript = {'template_string'}}
})

require('nvim-treesitter.configs').setup {autopairs = {enable = true}}

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% is only inside comment or string
npairs.add_rules({
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({'string', 'comment'})),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({'function'}))
})
