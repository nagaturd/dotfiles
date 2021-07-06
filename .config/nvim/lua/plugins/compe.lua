require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = {
    border = 'none',
    winhighlight = 'CompeDocumentation',
    max_width = 120,
    min_width = 40,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1
  },

  source = {
    path = true,
    buffer = true,
    calc = true,
    tags = true,
    spell = false,
    omni = true,
    nvim_lsp = true,
    nvim_lua = true,
    nvim_treesitter = true
  }
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
    -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
    -- return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
    -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    -- return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t '<S-Tab>'
  end
end

-- mappings
local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true, expr = true }
map('i', '<C-Space>', 'compe#complete()', opts)
map('i', '<CR>', 'compe#confirm(\'<CR>\')', opts)
map('i', '<C-e>', 'compe#close(\'<C-e>\')', opts)
map('i', '<C-f>', 'compe#scroll({ \'delta\': +4 })', opts)
map('i', '<C-d>', 'compe#scroll({ \'delta\': -4 })', opts)
map('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })