return function()
	local tree = safe_require 'nvim-tree'
	if not tree then
		return
	end

	tree.setup {
		disable_netrw = true,
		open_on_setup = true,
		focus_empty_on_setup = true,
		view = {
			adaptive_size = false,
			number = false,
			relativenumber = false,
			signcolumn = 'no',
		},
	}
end
