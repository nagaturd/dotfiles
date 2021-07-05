return {
  cmd = {
    vim.fn.stdpath('data') ..
        '/lspinstall/python/node_modules/.bin/pyright-langserver', '--stdio'
  },
  filetypes = { 'python' },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = true
      }
    }
  }
}
