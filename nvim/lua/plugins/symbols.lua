vim.g.symbols_outline = {
  highlight_hovered_item = false,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  show_numbers = false,
  show_symbol_details = false,
  keymaps = {
    close = '<Esc>',
    goto_location = '<CR>',
    focus_location = 'o',
    hover_symbol = '<C-space>',
    rename_symbol = 'r',
    code_actions = 'a'
  },
  lsp_blacklist = {}
}
