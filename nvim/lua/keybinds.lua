local key = vim.keymap

vim.g.mapleader = " "

local opts = { noremap = true }

-- tools.lua
key.set('n', '<leader>s', function() require('tools').makeScratch() end)
key.set('n', '<leader>l', function() require('tools').toggleList() end)

-- window navigation
key.set('t', '<A-h>', '<C-\\><C-N><C-w>h', opts)
key.set('t', '<A-j>', '<C-\\><C-N><C-w>j', opts)
key.set('t', '<A-k>', '<C-\\><C-N><C-w>k', opts)
key.set('t', '<A-l>', '<C-\\><C-N><C-w>l', opts)
key.set('i', '<A-h>', '<C-\\><C-N><C-w>h', opts)
key.set('i', '<A-j>', '<C-\\><C-N><C-w>j', opts)
key.set('i', '<A-k>', '<C-\\><C-N><C-w>k', opts)
key.set('i', '<A-l>', '<C-\\><C-N><C-w>l', opts)
key.set('n', '<A-h>', '<C-w>h', opts)
key.set('n', '<A-j>', '<C-w>j', opts)
key.set('n', '<A-k>', '<C-w>k', opts)
key.set('n', '<A-l>', '<C-w>l', opts)

-- true-zen.vim
local truezen = require('true-zen')

key.set('n', '<leader>zn', function()
  local first = 0
  local last = vim.api.nvim_buf_line_count(0)
  truezen.narrow(first, last)
end, opts)
key.set('v', '<leader>zn', function()
  local first = vim.fn.line('v')
  local last = vim.fn.line('.')
  truezen.narrow(first, last)
end, opts)
key.set('n', '<leader>zf', truezen.focus, opts)
key.set('n', '<leader>zm', truezen.minimalist, opts)
key.set('n', '<leader>za', truezen.ataraxis, opts)


