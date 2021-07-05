return {
  cmd = { vim.fn.stdpath('data') .. '/lspinstall/efm/efm-langserver' },
  init_options = { documentFormatting = true },
  filetypes = { 'sh', 'lua' },
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      lua = {
        {
          formatCommand = 'lua-format -i --indent-width=2 --double-quote-to-single-quote --spaces-inside-table-braces',
          formatStdin = true
        }
      },
      sh = { { formatCommand = 'shfmt -i 2 -ci -s -bn', formatStdin = true } }
    }
  }
}
