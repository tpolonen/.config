-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true,						-- false will only do exact matching
			override_generic_sorter = true,		-- override the generic sorter
			override_file_sorter = true,		-- override the file sorter
			case_mode = "smart_case",			-- or "ignore_case" or "respect_case"
												-- the default case_mode is "smart_case"
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				-- even more opts
			}

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	}
}

local opts = { noremap=true, silent=true }
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts) 
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

require('session-lens').setup {
	path_display = {'shorten'}
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")
require("telescope").load_extension("session-lens")
