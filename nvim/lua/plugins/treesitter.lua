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

-- autotags
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = { spacing = 5, severity_limit = 'Warning' },
      update_in_insert = true
    })

-- autopairs
require('nvim-autopairs').setup({
  disable_filetype = { 'TelescopePrompt' },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
  enable_moveright = true,
  enable_afterquote = true,
  enable_check_bracket_line = false,
  check_ts = true,
  ts_config = { lua = { 'string' }, javascript = { 'template_string' } },
  fast_wrap = {
    map = '<leader-e>',
    chars = { '{', '[', '(', '"', '\'' },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search'
  }
})

require('nvim-autopairs.completion.compe').setup({
  map_cr = true,
  map_complete = true
})

local Rule = require('nvim-autopairs.rule')
local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% is only inside comment or string
require('nvim-autopairs').add_rules({
  -- Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({'string', 'comment'})),
  Rule(' ', ' '):with_pair(function(opts)
    local pair = opts.line:sub(opts.col, opts.col + 1)
    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  end),
  Rule('( ', ' )'):with_pair(function() return false end):with_move(function()
    return true
  end):use_key(')'),
  Rule('{ ', ' }'):with_pair(function() return false end):with_move(function()
    return true
  end):use_key('}'),
  Rule('[ ', ' ]'):with_pair(function() return false end):with_move(function()
    return true
  end):use_key(']')
})
