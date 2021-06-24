local map = vim.api.nvim_set_keymap

-- nvim-compe keymaps
map("i", "<C-Space>", "compe#complete()",
    {expr = true, silent = true, noremap = true})
map("i", "<CR>", "compe#confirm('<CR>')",
    {expr = true, silent = true, noremap = true})
map("i", "<C-e>", "compe#close('<C-e>')",
    {expr = true, silent = true, noremap = true})
map("i", "<C-f>", "compe#scroll({ 'delta': +4 })",
    {expr = true, silent = true, noremap = true})
map("i", "<C-d>", "compe#scroll({ 'delta': -4 })",
    {expr = true, silent = true, noremap = true})
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- lspsaga
-- map("n", "gh", ":Lspsaga lsp_finder<CR>", { silent = true, noremap = true })
-- map("n", "<leader>ca", ":Lspsaga code_action<CR>", { silent = true, noremap = true })
-- map("n", "<leader>ca", "<C-U>:Lspsaga range_code_action<CR>", { silent = true, noremap = true })
-- map("n", "gs", ":Lspsaga signature_help<CR>", { silent = true, noremap = true })
-- map("n", "K", ":Lspsaga hover_doc<CR>", { silent = true, noremap = true })
-- map("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { silent = true, noremap = true })
-- map("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { silent = true, noremap = true })

-- formatter
map("n", "<leader>f", ":Format<CR>", {silent = true, noremap = true})

-- pane navigation
map("n", "<C-k>", ":wincmd k<CR>", {silent = true})
map("n", "<C-j>", ":wincmd j<CR>", {silent = true})
map("n", "<C-h>", ":wincmd h<CR>", {silent = true})
map("n", "<C-l>", ":wincmd l<CR>", {silent = true})
