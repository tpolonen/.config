local opt = vim.opt
local api = vim.api

-- Language
api.nvim_command('lan mes en_US')

-- Tabs and indents
opt.tabstop = 4
opt.shiftwidth = 0
opt.smartindent = true
opt.autoindent = true

-- Text display
opt.wrap = false
opt.scrolloff = 8
opt.listchars = {
	eol = '$',
	tab = '-->',
	multispace = '__',
	trail = '.',
	lead = '.',
	extends = '!',
}

-- Columns and numbers
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"
opt.signcolumn = 'yes'

-- Search
opt.hlsearch = false
opt.incsearch = true

-- Buffers
opt.hidden = true		-- Keep closed buffers active

-- Undo, swap, backup
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.updatetime = 100

-- Completion and popups
opt.completeopt = 'menuone,noinsert,noselect'

-- Status bar and commands
table.insert(opt.shortmess, 'fmnc')
opt.cmdheight = 2

-- Pretty colors
opt.termguicolors = true
