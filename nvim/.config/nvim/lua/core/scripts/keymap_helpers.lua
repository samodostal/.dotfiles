local M = {}

M.map = function(mode, key, cmd, opts)
	vim.api.nvim_set_keymap(mode, key, cmd, opts or { noremap = true, silent = true })
end

M.map_menu = function(title, key, commands)
	local Menu = safe_require 'nui.menu'

	if not Menu then
		return
	end

	local lines = {}

	for _, command in ipairs(commands) do
		table.insert(lines, Menu.item(command))
	end

	local menu = Menu({
		position = '50%',
		size = { width = 25 },
		border = {
			style = 'single',
			text = {
				top = ' ' .. title .. ' ',
				top_align = 'center',
			},
		},
		win_options = {
			number = true,
		},
	}, {
		lines = lines,
		keymap = {
			focus_next = { 'j', '<Down>' },
			focus_prev = { 'k', '<Up>' },
			close = { '<Esc>', 'q' },
			submit = { '<CR>' },
		},
		on_submit = function(item)
			vim.cmd(item.cmd)
		end,
	})

	vim.api.nvim_set_keymap('n', key, '', {
		noremap = true,
		silent = true,
		callback = function()
			menu:mount()
		end,
	})
end

return M
