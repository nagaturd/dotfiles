local cmd = vim.cmd
local fn = vim.fn
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local section = require('galaxyline').section
gl.short_line_list = { 'NvimTree', 'Outline' }

local colors = {
  bg = '#232433',
  bg1 = '#2a2b3d',
  bg2 = '#32344a',
  bg3 = '#3b3d57',
  red = '#f7768e',
  orange = '#ff9e64',
  yellow = '#e0af68',
  green = '#73daca',
  teal = '#2ac3de',
  cyan = '#7dcfff',
  blue = '#7aa2f7',
  magenta = '#bb9af7',
  fg = '#a9b1d6',
  text = '#9aa5ce',
  text_dark = '#565f89',
  error = '#db4b4b',
  warning = '#e0af68',
  info = '#0db9d7',
  hint = '#1abc9c'
}

section.left[1] = {
  ViMode = {
    provider = function()
      local mode_color = {
        n = colors.fg,
        i = colors.green,
        v = colors.blue,
        V = colors.blue,
        c = colors.red,
        no = colors.magenta,
        s = colors.orange,
        S = colors.orange,
        ic = colors.yellow,
        R = colors.magenta,
        Rv = colors.magenta,
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
    highlight = { colors.text, colors.bg },
    separator = '',
    separator_highlight = {
      function()
        if condition.buffer_not_empty() == true then
          return colors.bg2
        else
          return colors.bg1
        end
      end, colors.bg
    }
  }
}

section.left[2] = {
  FileIcon = {
    provider = function()
      return ' ' .. require('galaxyline.provider_fileinfo').get_file_icon()
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.text, colors.bg2 }
  }
}

section.left[3] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.text, colors.bg2 },
    separator = '',
    separator_highlight = { colors.bg2, colors.bg1 }
  }
}

section.left[4] = {
  CurrentDir = {
    provider = function()
      local dir_name = fn.fnamemodify(fn.getcwd(), ':t')
      return '  ' .. dir_name .. ' '
    end,
    highlight = { colors.text_dark, colors.bg1 },
    separator = '',
    separator_highlight = { colors.bg1, colors.bg }
  }
}

section.left[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = { colors.text_dark, colors.bg }
  }
}

section.left[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = { colors.text_dark, colors.bg }
  }
}

section.left[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = ' ',
    highlight = { colors.text_dark, colors.bg }
  }
}

section.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = ' ',
    highlight = { colors.error, colors.bg }
  }
}

section.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = ' ',
    highlight = { colors.warning, colors.bg }
  }
}

section.right[3] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = ' ',
    highlight = { colors.info, colors.bg }
  }
}

section.right[4] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = ' ',
    highlight = { colors.hint, colors.bg }
  }
}

section.right[5] = {
  ShowLSP = {
    provider = function()
      return require'galaxyline.provider_lsp'.get_lsp_client() .. ' '
    end,
    -- provider = function() return get_lsp_client() .. ' ' end,
    condition = function()
      local tbl = { ['dashboard'] = true, [' '] = true }
      if tbl[vim.bo.filetype] then return false end
      return true
    end,
    icon = ' ',
    highlight = { colors.text, colors.bg }
  }
}

section.right[6] = {
  GitBranch = {
    provider = function()
      return require('galaxyline.provider_vcs').get_git_branch() .. ' '
    end,
    condition = condition.check_git_workspace,
    icon = ' ',
    separator = '',
    separator_highlight = { colors.bg1, colors.bg },
    highlight = { colors.orange, colors.bg1 }
  }
}

section.right[7] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = '',
    separator_highlight = {
      colors.bg2, function()
        if condition.check_git_workspace() then
          return colors.bg1
        else
          return colors.bg
        end
      end
    },
    highlight = { colors.text, colors.bg2 }
  }
}

section.right[8] = {
  LinePercent = {
    provider = 'LinePercent',
    separator = '|',
    separator_highlight = { colors.text, colors.bg2 },
    highlight = { colors.text, colors.bg2 }
  }
}

section.short_line_left[1] = {
  Spacer = {
    provider = function() return ' ' end,
    highlight = { colors.none, colors.bg2 }
  }
}

section.short_line_left[2] = {
  BufferFileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = { colors.text, colors.bg2 }
  }
}

section.short_line_left[3] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.text, colors.bg2 },
    separator = '',
    separator_highlight = { colors.bg2, colors.bg }
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    condition = function()
      if require('galaxyline.provider_buffer').get_buffer_type_icon() then
        return true
      else
        return false
      end
    end,
    highlight = { colors.text, colors.bg1 },
    separator = '',
    separator_highlight = { colors.bg1, colors.bg }
  }
}
