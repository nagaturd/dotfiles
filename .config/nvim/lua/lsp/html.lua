return {
  cmd = {
    'node', vim.fn.stdpath('data') ..
        '/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js',
    '--stdio'
  },
  filetypes = { 'html' }
}
