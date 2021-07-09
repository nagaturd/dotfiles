return {
  cmd = {
    vim.fn.stdpath('data') ..
        '/lspinstall/vim/node_modules/.bin/vim-language-server', '--stdio'
  },
  init_options = { isNeovim = true }
}
