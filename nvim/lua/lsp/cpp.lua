return {
  cmd = {
    vim.fn.stdpath('data') .. '/lspinstall/cpp/clangd/bin/clangd',
    '--background-index'
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' }
}
