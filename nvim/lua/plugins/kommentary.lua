require('kommentary.config').configure_language('default', {
  hook_function = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end
})

-- Rust comments
require('kommentary.config').configure_language("rust", {
  prefer_single_line_comments = true
})
