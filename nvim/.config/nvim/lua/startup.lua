vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		local tree = safe_require 'nvim-tree'
		local harpoon = safe_require 'harpoon.ui'
		if not tree or not harpoon then
			return
		end

		tree.toggle(false, true)
	end,
})
