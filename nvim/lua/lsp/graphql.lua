return {
  cmd = {
    vim.fn.stdpath('data') ..
        '/lspinstall/graphql/node_modules/.bin/graphql-lsp', 'server', '-m',
    'stream'
  },
  filetypes = { 'graphql' }
}
