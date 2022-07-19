return function()
	local tree = safe_require("nvim-tree")
	if not tree then
		return
	end

	tree.setup({
		disable_netrw = true,
		view = {
			adaptive_size = true,
			number = false,
			relativenumber = false,
			signcolumn = "no",
		},
	})

	tree.toggle(false, true)
end
