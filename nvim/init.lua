local cmd = vim.cmd -- to execute Vim commands
local fn = vim.fn -- to call Vim functions
local g = vim.g	-- a table to access global variables
local opt = vim.opt -- to set options

opt.tabstop = 4 -- length of \t in spaces
opt.softtabstop = 4 -- length of tab/backspace keypress in spaces
opt.shiftwidth = 4 -- length of indentation in spaces
opt.expandtab = true -- converts \t to spaces
opt.backup = false -- don't create backups
opt.writebackup = false -- don't create a backup before overwriting a file
opt.swapfile = false -- don't create a swap file
opt.incsearch = true -- update search while typing
opt.nohlsearch = true -- stop highlighting when searching
opt.showmode = false -- hides current mode
opt.wildmode = { "longest", "list", "full" }
opt.wildmenu = true -- completion menu
opt.cmdheight = 2 -- more space for displaying messages
opt.inccommand = "split" -- make substitution work in realtime
opt.shortmess:append('c') -- don't pass messages to |ins-completion-menu|
opt.iskeyword:append('-') -- treat dash separated words as a word text object
opt.fileencoding = "utf-8" -- encoding written to file
opt.whichwrap:append { "<", ">", "]", "]" } -- move to the next/previous lines when at 0/$
opt.mouse = "a"	-- enable mouse
opt.pumheight = 10 -- makes popup menu smaller
opt.conceallevel = 0 -- show text normally
opt.scrolloff = 8 -- start scrolling this many lines from edge
opt.wrap = false -- display long lines as just one line
opt.cursorline = true -- highlights current line
opt.showtabline = true -- show tabs
opt.number = true -- show numbered lines
opt.relativenumber = true -- show relative line numbers
opt.signcolumn = "yes" -- show the sign column
opt.colorcolumn = 80 -- use for max line length guide
opt.syntax = "enable" -- syntax highlighting
opt.termguicolors = true -- set term gui colors
-- opt.guifont = "" -- choose a font to use
opt.splitbelow = true -- horizontal splits will automatically be below
opt.splitright = true -- vertical splits will automatically be to the right
opt.hidden = true -- required to keep multiple buffers open
opt.updatetime = 50 -- increase how often updates happen
