return {
  cmd = { vim.fn.stdpath('data') .. '/lspinstall/efm/efm-langserver' },
  init_options = { documentFormatting = true },
  filetypes = {
    'sh', 'lua', 'typescript', 'javascript', 'typescriptreact',
    'javascriptreact'
  },
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      lua = {
        {
          formatCommand = 'lua-format -i --indent-width=2 --double-quote-to-single-quote --spaces-inside-table-braces',
          formatStdin = true
        }
      },
      sh = {
        { formatCommand = 'shfmt -i 2 -ci -s -bn', formatStdin = true }, {
          lintCommand = 'shellcheck -f gcc -x',
          lintFormats = { '%f:%l:%c: %trror: %m', '%f:%l:%c: %tote: %m' }
        }
      },
      typescript = {
        { formatCommand = './node_modules/.bin/prettier' }, {
          lintCommand = 'eslint --stdin --stdin-filename ${INPUT}',
          lintStdin = true,
          lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' },
          lintIgnoreExitCode = true
        }
      },
      javascript = {},
      typescriptreact = {},
      javascriptreact = {}
    }
  }
}
