local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

--- @type bufferline.utils.hl
local hl = require('bufferline.utils').hl

--- @type barbar.utils.hl.group
local fg_target = {cterm = 'red'}
fg_target.gui = fg_target.cterm

local fg_current  = hl.fg_or_default({'TablineSel'}, '#efefef', 255)
local fg_visible  = hl.fg_or_default({'Normal'}, '#efefef', 255)
local fg_inactive = hl.fg_or_default({'TabLineFill'}, '#888888', 102)

local fg_modified = hl.fg_or_default({'WarningMsg'}, '#E5AB0E', 178)
local fg_special  = hl.fg_or_default({'Special'}, '#599eff', 75)
local fg_subtle = hl.fg_or_default({'NonText', 'Comment'}, '#555555', 240)

local bg_current  = hl.bg_or_default({'TabLineSel'}, 'none')
local bg_visible  = hl.bg_or_default({'Normal', 'Normal'}, 'none')
local bg_inactive = hl.bg_or_default({'TabLineFill', 'StatusLine'}, 'none')

--      Current: current buffer
--      Visible: visible but not current buffer
--     Inactive: invisible but not current buffer
--        -Icon: filetype icon
--       -Index: buffer index
--         -Mod: when modified
--        -Sign: the separator between buffers
--      -Target: letter in buffer-picking mode
hl.set('BufferDefaultCurrent',        bg_current, fg_current)
hl.set('BufferDefaultCurrentIndex',   bg_current, fg_special)
hl.set('BufferDefaultCurrentMod',     bg_current, fg_modified)
hl.set('BufferDefaultCurrentSign',    bg_current, fg_special)
hl.set('BufferDefaultCurrentTarget',  bg_current, fg_target, true)
hl.set('BufferDefaultInactive',       bg_inactive, fg_inactive)
hl.set('BufferDefaultInactiveIndex',  bg_inactive, fg_subtle)
hl.set('BufferDefaultInactiveMod',    bg_inactive, fg_modified)
hl.set('BufferDefaultInactiveSign',   bg_inactive, fg_subtle)
hl.set('BufferDefaultInactiveTarget', bg_inactive, fg_target, true)
hl.set('BufferDefaultTabpageFill',    bg_inactive, fg_inactive)
hl.set('BufferDefaultTabpages',       bg_inactive, fg_special, true)
hl.set('BufferDefaultVisible',        bg_visible, fg_visible)
hl.set('BufferDefaultVisibleIndex',   bg_visible, fg_visible)
hl.set('BufferDefaultVisibleMod',     bg_visible, fg_modified)
hl.set('BufferDefaultVisibleSign',    bg_visible, fg_visible)
hl.set('BufferDefaultVisibleTarget',  bg_visible, fg_target, true)
