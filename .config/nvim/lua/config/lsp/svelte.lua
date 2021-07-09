return {
  cmd = {
    vim.fn.stdpath('data') ..
        '/lspinstall/svelte/node_modules/.bin/svelteserver', '--stdio'
  },
  filetypes = { 'svelte' }
}
