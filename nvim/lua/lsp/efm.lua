return {
  init_options = { documentFormatting = true },
  filetypes = { 'lua', 'sh' },
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
