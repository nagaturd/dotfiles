return {
  cmd = { vim.fn.stdpath('data') .. '/lspinstall/efm/efm-langserver' },
  init_options = { documentFormatting = true },
  filetypes = {
    'sh', 'lua', 'typescript', 'javascript', 'typescriptreact',
    'javascriptreact'
  },
  settings = {
    rootMarkers = { 'package.json', '.git/' },
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
        {
          formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
          formatStdin = true
        }, {
          lintCommand = './node_modules/.bin/eslint_d -f unix --stdin --stdin-filename ${INPUT}',
          lintStdin = true,
          lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' },
          lintIgnoreExitCode = true
        }
      },
      javascript = {
        {
          formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
          formatStdin = true
        }, {
          lintCommand = './node_modules/.bin/eslint_d -f unix --stdin --stdin-filename ${INPUT}',
          lintStdin = true,
          lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' },
          lintIgnoreExitCode = true
        }
      },
      typescriptreact = {
        {
          formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
          formatStdin = true
        }, {
          lintCommand = './node_modules/.bin/eslint_d -f unix --stdin --stdin-filename ${INPUT}',
          lintStdin = true,
          lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' },
          lintIgnoreExitCode = true
        }
      },
      javascriptreact = {
        {
          formatCommand = './node_modules/.bin/prettier --stdin-filepath ${INPUT}',
          formatStdin = true
        }, {
          lintCommand = './node_modules/.bin/eslint_d -f unix --stdin --stdin-filename ${INPUT}',
          lintStdin = true,
          lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' },
          lintIgnoreExitCode = true
        }
      }
    }
  }
}
