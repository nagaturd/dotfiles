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

-- local cond = require('nvim-autopairs.conds')
-- local ts_conds = require('nvim-autopairs.ts-conds')
-- local Rule = require('nvim-autopairs.rule')
