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

vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		open_harpooned_files()
	end,
})

vim.opt.statusline = "%!v:lua.require('core.statusline').setup()"
