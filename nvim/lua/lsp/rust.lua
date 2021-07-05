return {
  cmd = { vim.fn.stdpath('data') .. '/lspinstall/rust/rust_analyzer' },
  filetypes = { 'rust' },
  settings = { ['rust-analyzer'] = {} }
}
