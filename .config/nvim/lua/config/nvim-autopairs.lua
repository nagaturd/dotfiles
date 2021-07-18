require('nvim-autopairs').setup({
  enable_check_bracket_line = false,
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', '')
})

require('nvim-autopairs.completion.compe').setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

local npairs = require('nvim-autopairs')

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add pair on that treesitter node
    javascript = { 'template_string' },
    java = false -- don't check treesitter on java
  },
  fast_wrap = {}
})

local Rule = require('nvim-autopairs.rule')
npairs.add_rules {
  Rule(' ', ' '):with_pair(function(opts)
    local pair = opts.line:sub(opts.col, opts.col + 1)
    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  end), Rule('( ', ' )'):with_pair(function() return false end):with_move(
      function(opts) return opts.prev_char:match('.%)') ~= nil end):use_key(')'),
  Rule('{ ', ' }'):with_pair(function() return false end):with_move(
      function(opts) return opts.prev_char:match('.%}') ~= nil end):use_key('}'),
  Rule('[ ', ' ]'):with_pair(function() return false end):with_move(
      function(opts) return opts.prev_char:match('.%]') ~= nil end):use_key(']')
}

-- local cond = require('nvim-autopairs.conds')
-- local ts_conds = require('nvim-autopairs.ts-conds')
