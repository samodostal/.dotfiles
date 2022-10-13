vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		local tree = safe_require 'nvim-tree'
		if not tree then
			return
		end

		tree.toggle(false, true)
	end,
})
