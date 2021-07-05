require'lspsaga'.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  dianostic_header_icon = '  ',
  code_action_icon = ' ',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true
  },
  finder_definition_icon = ' ',
  finder_reference_icon = ' ',
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 's',
    quit = 'q', -- quit can be a table
    scroll_down = '<C-f>',
    scroll_up = '<C-b>'
  },
  code_action_keys = { quit = 'q', exec = '<CR>' },
  rename_action_keys = {
    quit = '<C-c>', -- quit can be a table
    exec = '<CR>'
  },
  definition_preview_icon = ' ',
  -- "single" "double" "round" "plus"
  border_style = 'round',
  rename_prompt_prefix = ' '
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = {metals = {'sbt', 'scala'}}
  -- server_filetype_map = {}
}

-- mappings
local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }
map('n', 'gh', ':Lspsaga lsp_finder<CR>', opts)
map('n', 'gr', ':Lspsaga rename<CR>', opts)
map('n', 'gs', ':Lspsaga signature_help<CR>', opts)
map('n', 'gd', ':Lspsaga preview_definition<CR>', opts)
map('n', '<leader>cd', ':Lspsaga show_line_diagnostics<CR>', opts)
map('n', '<leader>cc', ':Lspsaga show_cursor_diagnostics<CR>', opts)
map('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', opts)
map('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', 'K', ':Lspsaga hover_doc<CR>', opts)
map('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
map('v', '<leader>ca', '<C-U>:Lspsaga range_code_action<CR>', opts)
map('n', '<C-f>',
    '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', opts)
map('n', '<C-b>',
    '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', opts)
