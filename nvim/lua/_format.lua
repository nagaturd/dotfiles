require('formatter').setup({
  logging = false,
  filetype = {
    lua = {
      -- luafmt
      function()
        return
            {exe = "lua-format", args = {"-i --indent-width=2"}, stdin = true}
      end
    }
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua FormatWrite
augroup END
]], true)
