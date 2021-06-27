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
  filetype = {'packer', 'qf'},
  buftype = {'terminal'}
}
g.nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}
g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1, folder_arrows = 0}
g.nvim_tree_icons = {
  default = ' ',
  symlink = '',
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "",
    deleted = "",
    ignored = ""
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = ""
  },
  lsp = {hint = "", info = "", warning = "", error = ""}
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>',
                        {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>',
                        {noremap = true})
