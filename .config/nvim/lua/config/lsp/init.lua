-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function()
  require('lsp_signature').on_attach({
    bind = true,
    handler_opts = { border = 'single' },
    hint_prefix = '',
    use_lspsaga = true
  })

  -- mappings
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local opts = { noremap = true, silent = true }
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

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { 'documentation', 'detail', 'additionalTextEdits' }
  }
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

local function install_servers()
  local required_servers = {
    'efm', 'lua', 'bash', 'graphql', 'cpp', 'typescript', 'python',
    'dockerfile', 'html', 'css', 'json', 'rust', 'svelte', 'vim', 'yaml'
  }
  local installed_servers = require'lspinstall'.installed_servers()
  for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
      require'lspinstall'.install_server(server)
    end
  end
end

local function setup_servers()
  require'lspinstall'.setup()

  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    local config = make_config()

    -- add custom config if one exists
    if pcall(require, 'config.lsp.' .. server) then
      config = vim.tbl_extend('force', config, require('config.lsp.' .. server))
    end

    require'lspconfig'[server].setup(config)
  end
end

install_servers()
setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = { prefix = '', spacing = 0 },
      signs = true,
      underline = true,
      update_in_insert = true
    })

vim.lsp.protocol.CompletionItemKind = {
  '   (Text) ', '   (Method)', '   (Function)', '   (Constructor)',
  ' ﴲ  (Field)', '[] (Variable)', '   (Class)', ' ﰮ  (Interface)',
  '   (Module)', ' 襁 (Property)', '   (Unit)', '   (Value)',
  ' 練 (Enum)', '   (Keyword)', '   (Snippet)', '   (Color)',
  '   (File)', '   (Reference)', '   (Folder)', '   (EnumMember)',
  ' ﲀ  (Constant)', ' ﳤ  (Struct)', '   (Event)', '   (Operator)',
  '   (TypeParameter)'
}

-- format on save
vim.api.nvim_exec([[ 
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.gql lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.graphql lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.vim lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.yaml lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 500)
autocmd BufWritePre *.dockerfile lua vim.lsp.buf.formatting_sync(nil, 500)
]], true)
