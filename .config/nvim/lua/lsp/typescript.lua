return {
  cmd = {
    vim.fn.stdpath('data') ..
        '/lspinstall/typescript/node_modules/.bin/typescript-language-server',
    '--stdio'
  },
  filetypes = {
    'javascript', 'javascriptreact', 'javascript.jsx', 'typescript',
    'typescriptreact', 'typescript.tsx'
  },
  settings = { documentFormatting = true }
}

