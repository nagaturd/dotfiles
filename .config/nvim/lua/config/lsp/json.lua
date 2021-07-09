return {
  cmd = {
    'node', vim.fn.stdpath('data') ..
        '/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js',
    '--stdio'
  },
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
      end
    }
  }
}
