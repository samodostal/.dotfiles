require 'core.options'

local plugins = require 'plugins'

plugins.init()
plugins.load('common', 'code', 'note')

require 'core.keymaps'
require 'core.theme'

require 'core.scripts.startup'
require 'core.scripts.bufenter'

-- Experimentation

-- local config = {
-- 	layouts = {
-- 		default = {
-- 			left = {
-- 				{
-- 					filetype = 'nvim-tree',
-- 					pinned = true,
-- 				},
-- 				{
-- 					filetype = 'Aerial',
-- 					pinned = true,
-- 				},
-- 			},
-- 			bottom = {
-- 				{
-- 					filetype = 'quickfix',
-- 					pinned = true,
-- 				},
-- 			},
-- 			floating = {
-- 				{
-- 					filetype = 'help',
-- 					pinned = false,
-- 				},
-- 			},
-- 		},
-- 		debugging = {},
-- 	},
-- 	current_layout = 'default',
-- }

-- local state = {}

-- local current_layout = config.layouts[config.current_layout]
-- local floating_windows = current_layout.floating

-- -- Define a function to open a floating window and display the buffer
-- local function open_floating_window(bufnr)
--     -- Calculate the window size and position
--     local width = 80  -- Adjust as needed
--     local height = 20  -- Adjust as needed
--     local row = vim.o.lines / 2 - height / 2
--     local col = vim.o.columns / 2 - width / 2

--     -- Create a new floating window
--     local opts = {
--         relative = 'editor',
--         row = row,
--         col = col,
--         width = width,
--         height = height,
--     }
--     local win_id = vim.api.nvim_open_win(bufnr, true, opts)

--     -- Set the window options (optional)
--     vim.api.nvim_win_set_option(win_id, 'number', false)
--     vim.api.nvim_win_set_option(win_id, 'wrap', false)
-- end

-- for _, window in pairs(floating_windows) do
-- 	vim.api.nvim_create_autocmd({ 'FileType' }, {
-- 		pattern = window.filetype,
-- 		callback = function(ev)
-- 			vim.notify(vim.inspect(ev))
-- 		end,
-- 	})
-- end
-- 			-- open_floating_window(ev.buf)
