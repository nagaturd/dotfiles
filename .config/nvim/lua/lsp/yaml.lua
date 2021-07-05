return {
  cmd = {
    vim.fn.stdpath('data') ..
        '/lspinstall/yaml/node_modules/.bin/yaml-language-server', '--stdio'
  },
  filetypes = { 'yaml' }
}
