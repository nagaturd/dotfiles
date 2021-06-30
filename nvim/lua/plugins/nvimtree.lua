local g = vim.g
g.nvim_tree_side = 'left'
g.nvim_tree_width = 30
g.nvim_tree_ignore = {}
g.nvim_tree_gitignore = 0
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 1
g.nvim_tree_auto_ignore_ft = {} -- don't auto open on these filetypes
g.nvim_tree_quit_on_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 2
g.nvim_tree_root_folder_modifier = ':~' -- see ":h filename-modifiers"
g.nvim_tree_tab_open = 1
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_disable_netrw = 1
g.nvim_tree_hijack_netrw = 1
g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_hijack_cursor = 1
g.nvim_tree_icon_padding = ' '
g.nvim_tree_update_cwd = 1
g.nvim_tree_window_picker_exclude = {
  filetype = { 'packer', 'qf' },
  buftype = { 'terminal' }
}
g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 0 }
g.nvim_tree_icons = {
  default = ' ',
  symlink = '',
  git = {
    unstaged = '',
    staged = '',
    unmerged = '',
    renamed = '',
    untracked = '',
    deleted = '',
    ignored = ''
  },
  folder = {
    arrow_open = '',
    arrow_closed = '',
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = ''
  },
  lsp = { hint = '', info = '', warning = '', error = '' }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
g.nvim_tree_bindings = {
  ['<CR>'] = tree_cb('edit'),
  ['o'] = tree_cb('edit'),
  ['<2-LeftMouse>'] = tree_cb('edit'),
  ['<2-RightMouse>'] = tree_cb('cd'),
  ['<C-]>'] = tree_cb('cd'),
  ['<C-v>'] = tree_cb('vsplit'),
  ['<C-x>'] = tree_cb('split'),
  ['<C-t>'] = tree_cb('tabnew'),
  ['<'] = tree_cb('prev_sibling'),
  ['>'] = tree_cb('next_sibling'),
  ['<BS>'] = tree_cb('close_node'),
  ['<S-CR>'] = tree_cb('close_node'),
  ['<Tab>'] = tree_cb('preview'),
  ['I'] = tree_cb('toggle_ignored'),
  ['H'] = tree_cb('toggle_dotfiles'),
  ['R'] = tree_cb('refresh'),
  ['a'] = tree_cb('create'),
  ['d'] = tree_cb('remove'),
  ['r'] = tree_cb('rename'),
  ['<C-r>'] = tree_cb('full_rename'),
  ['x'] = tree_cb('cut'),
  ['c'] = tree_cb('copy'),
  ['p'] = tree_cb('paste'),
  ['y'] = tree_cb('copy_name'),
  ['Y'] = tree_cb('copy_path'),
  ['gy'] = tree_cb('copy_absolute_path'),
  ['[c'] = tree_cb('prev_git_item'),
  [']c'] = tree_cb('next_git_item'),
  ['-'] = tree_cb('dir_up'),
  ['q'] = tree_cb('close')
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>',
                        { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>',
                        { noremap = true })
