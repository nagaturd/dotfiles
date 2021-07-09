local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg', '--color=never', '--no-heading', '--with-filename', '--line-number',
      '--column', '--smart-case'
    },
    layout_prompt_position = 'bottom',
    prompt_prefix = '  ',
    selection_caret = '  ',
    entry_prefix = '   ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'flex',
    layout_config = {
      horizontal = { mirror = false, preview_width = 80 },
      vertical = { mirror = false, preview_cutoff = 0 },
      center = { height = 30, width = 80, preview_cutoff = 1000 },
      flex = { flip_columns = 160, flip_lines = 30 }
    },
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 5,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ['<C-c>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<CR>'] = actions.select_default + actions.center
      },
      n = {
        ['j'] = actions.move_selection_next,
        ['k'] = actions.move_selection_previous,
        ['c'] = actions.close,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  },
  pickers = {
    buffers = {
      theme = 'dropdown',
      previewer = false,
      layout_config = { width = 50 },
      mappings = {
        i = { ['<C-d>'] = actions.delete_buffer },
        n = { ['d'] = actions.delete_buffer }
      }
    }
  },
  extensions = {
    fzy_native = { override_generic_sorter = false, override_file_sorter = true },
    project = { base_dirs = { '~/.config', { '~/projects', max_depth = 2 } } }
  }
}

require'telescope'.load_extension('fzy_native')

-- mappings
local map = vim.api.nvim_set_keymap
-- file pickers
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true })
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true })
-- vim pickers
map('n', '<leader>vb', '<cmd>Telescope buffers<CR>', { noremap = true })
map('n', '<leader>vh', '<cmd>Telescope help_tags<CR>', { noremap = true })
-- lsp pickers
map('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>',
    { noremap = true })
map('n', '<leader>le', '<cmd>Telescope lsp_document_diagnostics<CR>',
    { noremap = true })
-- git
map('n', '<leader>gc', '<cmd>Telescope git_commits<CR>', { noremap = true })
map('n', '<leader>gs', '<cmd>Telescope git_status<CR>', { noremap = true })
-- treesitter
map('n', '<leader>tt', '<cmd>Telescope treesitter<CR>', { noremap = true })
