return function()
	local tree = safe_require 'nvim-tree'
	if not tree then
		return
	end

	tree.setup {
		disable_netrw = true,
		view = {
			adaptive_size = false,
			number = false,
			relativenumber = true,
			signcolumn = 'no',
		},
	}
end
