return {
  cmd = {
    'node', vim.fn.stdpath('data') ..
        '/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js',
    '--stdio'
  },
  filetypes = { 'css', 'scss', 'less' }
}
