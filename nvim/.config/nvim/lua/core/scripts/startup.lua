local function open_harpooned_files()
	local harpoon = safe_require 'harpoon'
	if not harpoon then
		return
	end

	local marks = harpoon.get_mark_config().marks

	for _, mark in ipairs(marks) do
		local filename = mark.filename
		vim.cmd('bad ' .. filename)
	end
end

local function open_nvim_tree()
	require('nvim-tree.api').tree.toggle {
		focus = false,
	}
end

local function open_aerial()
	require('aerial').open {
		focus = false,
	}
end

local function open_quickfixlist()
	vim.cmd [[ copen | wincmd p ]]
end

vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		open_harpooned_files()
		open_nvim_tree()
		open_aerial()
		-- open_quickfixlist()
	end,
})

vim.opt.statusline = "%!v:lua.require('core.statusline').setup()"
