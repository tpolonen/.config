-- Utility functions

local M ={}
-- Create scratch buffer
function M.makeScratch()
	vim.api.nvim_command('enew')	-- equivalent to :enew
	vim.bo[0].buftype='nofile'	-- set the current buffer's (buffer [0]) buftype to nofile
	vim.bo[0].bufhidden='hide'
	vim.bo[0].swapfile=false
end

-- Toggle list view
function M.toggleList()
	vim.opt.list = not vim.opt.list
end
return M


