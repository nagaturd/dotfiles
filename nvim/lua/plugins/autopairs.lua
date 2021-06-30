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
})
