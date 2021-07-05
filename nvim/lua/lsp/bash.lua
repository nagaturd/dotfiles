return {
  cmd = {
    vim.fn.stdpath('data') ..
        '/lspinstall/bash/node_modules/.bin/bash-language-server', 'start'
  },
  filetypes = { 'sh', 'zsh' }
}
