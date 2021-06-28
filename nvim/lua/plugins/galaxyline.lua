local cmd = vim.cmd
local fn = vim.fn
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local section = gl.section
gl.short_line_list = { 'NvimTree', 'DiffviewFiles', 'Outline' }

local colors = {
  none = 'NONE',
  bg_dark = '#1f2335',
  bg = '#24283b',
  bg_highlight = '#292e42',
  terminal_black = '#414868',
  fg = '#c0caf5',
  fg_dark = '#a9b1d6',
  fg_gutter = '#3b4261',
  comment = '#565f89',
  blue = '#7aa2f7',
  cyan = '#7dcfff',
  magenta = '#bb9af7',
  purple = '#9d7cd8',
  orange = '#ff9e64',
  yellow = '#e0af68',
  green = '#9ece6a',
  teal = '#1abc9c',
  red = '#f7768e',
  git = {
    change = '#6183bb',
    add = '#449dab',
    delete = '#914c54',
    conflict = '#bb7a61'
  },
  gitSigns = { add = '#164846', change = '#394b70', delete = '#823c41' }
}

section.left[1] = {
  ViMode = {
    provider = function()
      local mode_color = {
        n = colors.fg,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.red,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red
      }
      cmd('hi GalaxyViMode guifg=' .. mode_color[fn.mode()])
      return '     '
    end,
    highlight = { colors.fg, colors.bg, 'bold' }
  }
}

section.left[2] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg
    }
  }
}

section.left[3] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.purple, colors.bg, 'bold' }
  }
}

section.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    icon = ' ',
    highlight = { colors.orange, colors.bg, 'bold' }
  }
}

section.left[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = { colors.gitSigns.add, colors.bg }
  }
}

section.left[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = { colors.gitSigns.change, colors.bg }
  }
}

section.left[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = { colors.gitSigns.delete, colors.bg }
  }
}

section.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
    highlight = { colors.red, colors.bg }
  }
}

section.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ',
    highlight = { colors.yellow, colors.bg }
  }
}

section.right[3] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = ' ',
    highlight = { colors.blue, colors.bg }
  }
}

section.right[4] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = ' ',
    highlight = { colors.cyan, colors.bg }
  }
}

section.right[5] = {
  Tabstop = {
    provider = function()
      return 'Spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
    end,
    separator = ' ',
    separator_highlight = { colors.none, colors.bg },
    highlight = { colors.comment, colors.bg }
  }
}

section.right[6] = {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' |',
    separator_highlight = { colors.comment, colors.bg },
    highlight = { colors.comment, colors.bg }
  }
}

section.right[7] = {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' | ',
    separator_highlight = { colors.comment, colors.bg },
    highlight = { colors.comment, colors.bg }
  }
}

section.right[8] = {
  ShowLSP = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then return false end
      return true
    end,
    icon = ' ',
    separator = ' | ',
    separator_highlight = { colors.comment, colors.bg },
    highlight = { colors.comment, colors.bg, 'bold' }
  }
}

section.right[9] = {
  FileType = {
    provider = 'FileTypeName',
    condition = condition.buffer_not_empty,
    separator = ' | ',
    separator_highlight = { colors.comment, colors.bg },
    highlight = { colors.comment, colors.bg, 'bold' }
  }
}

section.right[10] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' |',
    separator_highlight = { colors.comment, colors.bg },
    highlight = { colors.comment, colors.bg }
  }
}

section.short_line_left[1] = {
  Spacer = {
    provider = function() return ' ' end,
    highlight = { colors.none, colors.bg }
  }
}

section.short_line_left[2] = {
  BufferFileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {
      require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg
    }
  }
}

section.short_line_left[3] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' }
  }
}

section.short_line_right[1] = {
  BufferIcon = { provider = 'BufferIcon', highlight = { colors.fg, colors.bg } }
}
