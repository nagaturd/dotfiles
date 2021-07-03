-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require('lsp_signature').on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --[[ buf_set_keymap('n', '<leader>wa',
                 '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts) ]]
  --[[ buf_set_keymap('n', '<leader>wr',
                 '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts) ]]
  --[[ buf_set_keymap('n', '<leader>wl',
                 '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                 opts) ]]
  --[[ buf_set_keymap('n', '<leader>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>',
                 opts) ]]
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --[[ buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                 opts) ]]
  -- buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  --[[ buf_set_keymap('n', '<leader>e',
                 '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts) ]]
  -- buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --[[ buf_set_keymap('n', '<leader>q',
                 '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts) ]]
end

vim.lsp.protocol.CompletionItemKind = {
  '   (Text) ', '   (Method)', '   (Function)', '   (Constructor)',
  ' ﴲ  (Field)', '[] (Variable)', '   (Class)', ' ﰮ  (Interface)',
  '   (Module)', ' 襁 (Property)', '   (Unit)', '   (Value)',
  ' 練 (Enum)', '   (Keyword)', '   (Snippet)', '   (Color)',
  '   (File)', '   (Reference)', '   (Folder)', '   (EnumMember)',
  ' ﲀ  (Constant)', ' ﳤ  (Struct)', '   (Event)', '   (Operator)',
  '   (TypeParameter)'
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    local config = make_config()

    -- add custom config if one exists
    if pcall(require, 'lsp/' .. server) then
      config = vim.tbl_extend('force', config, require('lsp/' .. server))
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end

-- Format on save
vim.api.nvim_exec([[
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts, lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx, lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.js, lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx, lua vim.lsp.buf.formatting_sync(nil, 100)
]], true)

require'lspsaga'.init_lsp_saga {
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  dianostic_header_icon = '   ',
  code_action_icon = ' ',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true
  },
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    quit = 'q',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = { quit = 'q', exec = '<CR>' },
  rename_action_keys = {
    quit = '<C-c>',
    exec = '<CR>' -- quit can be a table
  },
  definition_preview_icon = '  ',
  -- "single" "double" "round" "plus"
  border_style = 'round',
  rename_prompt_prefix = ' '
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = {metals = {'sbt', 'scala'}}
  -- server_filetype_map = {}
}
