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
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.sh lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.gql lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.vim lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.yaml lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.css lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.dockerfile lua vim.lsp.buf.formatting_sync(nil, 100)
]], true)
