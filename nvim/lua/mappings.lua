local map = vim.api.nvim_set_keymap

-- nvim-compe
local opts_expr = {silent = true, noremap = true, expr = true}
map("i", "<C-Space>", "compe#complete()", opts_expr)
map("i", "<CR>", "compe#confirm('<CR>')", opts_expr)
map("i", "<C-e>", "compe#close('<C-e>')", opts_expr)
map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", opts_expr)
map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", opts_expr)
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>',
    {noremap = true})
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>',
    {noremap = true})
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>',
    {noremap = true})
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>',
    {noremap = true})

-- lspsaga
local opts = {silent = true, noremap = true}
map("n", "gh", ":Lspsaga lsp_finder<CR>", opts)
map('n', 'gr', ':Lspsaga rename<CR>', opts)
map("n", "gs", ":Lspsaga signature_help<CR>", opts)
map("n", "gd", ":Lspsaga preview_definition<CR>", opts)
map("n", "<leader>cd", ":Lspsaga show_line_diagnostics", opts)
map("n", "<leader>cd", ":Lspsaga show_cursor_diagnostics", opts)
map("n", "[e", ":Lspsaga diagnostic_jump_next", opts)
map("n", "]e", ":Lspsaga diagnostic_jump_prev", opts)
map("n", "K", ":Lspsaga hover_doc<CR>", opts)
map("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
map("n", "<leader>ca", "<C-U>:Lspsaga range_code_action<CR>", opts)
map("n", "<C-f>",
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
map("n", "<C-b>",
    "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

-- pane navigation
map("n", "<C-k>", ":wincmd k<CR>", {silent = true})
map("n", "<C-j>", ":wincmd j<CR>", {silent = true})
map("n", "<C-h>", ":wincmd h<CR>", {silent = true})
map("n", "<C-l>", ":wincmd l<CR>", {silent = true})
