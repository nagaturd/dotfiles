local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return require("lua-dev").setup({
  library = {vimruntime = true, types = true, plugins = true},
  lspconfig = {
    settings = {
      Lua = {
        runtime = {
          -- LuaJIT in the case of Neovim
          version = 'LuaJIT',
          path = runtime_path
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'}
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
          }
        }
      }
    }

  }
})
