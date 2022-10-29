local key = vim.keymap

vim.g.mapleader = " "

-- tools.lua
key.set('n', '<Leader>s', function() require('tools').makeScratch() end)
key.set('n', '<Leader>l', function() require('tools').toggleList() end)

-- true-zen.vim
local truezen = require('true-zen')

key.set('n', '<leader>zn', function()
  local first = 0
  local last = vim.api.nvim_buf_line_count(0)
  truezen.narrow(first, last)
end, { noremap = true })
key.set('v', '<leader>zn', function()
  local first = vim.fn.line('v')
  local last = vim.fn.line('.')
  truezen.narrow(first, last)
end, { noremap = true })
key.set('n', '<leader>zf', truezen.focus, { noremap = true })
key.set('n', '<leader>zm', truezen.minimalist, { noremap = true })
key.set('n', '<leader>za', truezen.ataraxis, { noremap = true })


