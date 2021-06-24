local opt = vim.opt -- to set options

opt.tabstop = 4; -- length of \t in spaces
opt.softtabstop = 4; -- length of tab/backspace keypress in spaces
opt.shiftwidth = 4; -- length of indentation in spaces
opt.expandtab = true; -- converts \t to spaces
opt.backup = false; -- don't create backups
opt.writebackup = false; -- don't create a backup before overwriting a file
opt.swapfile = false; -- don't create a swap file
opt.incsearch = true; -- update search while typing
opt.hlsearch = false; -- stop highlighting when searching
opt.showmode = false; -- hides current mode
opt.wildmode = {"longest", "list", "full"};
opt.wildmenu = true; -- completion menu
opt.completeopt = {"menu", "menuone", "noselect", "noinsert"}; -- completion menu
opt.cmdheight = 2; -- more space for displaying messages
opt.inccommand = "split"; -- make substitution work in realtime
opt.shortmess:append("c"); -- disable some stuff on shortmess
opt.iskeyword:append('-'); -- treat dash separated words as a word text object
opt.fileencoding = "utf-8"; -- encoding written to file
opt.whichwrap:append("<,>,],]"); -- move to the next/previous lines when at 0/$
opt.mouse = "a"; -- enable mouse
opt.pumheight = 10; -- limit completion menu items
opt.scrolloff = 8; -- start scrolling this many lines from edge
opt.sidescrolloff = 15; -- start scrolling this many columns from edge
opt.laststatus = 2; -- always show statusline
opt.wrap = false; -- display long lines as just one line
opt.list = true;
opt.listchars = {eol = "↲", tab = "» "};
opt.cursorline = true; -- highlights current line
opt.showtabline = 2; -- show tabs
opt.number = true; -- show numbered lines
opt.relativenumber = true; -- show relative line numbers
opt.signcolumn = "yes"; -- show the sign column
opt.colorcolumn = "80"; -- use for max line length guide
opt.syntax = "enable"; -- syntax highlighting
opt.termguicolors = true; -- set term gui colors
opt.splitbelow = true; -- horizontal splits will automatically be below
opt.splitright = true; -- vertical splits will automatically be to the right
opt.hidden = true; -- required to keep multiple buffers open
opt.updatetime = 50; -- increase how often updates happen
-- opt.guifont = ""; -- choose a font to use
