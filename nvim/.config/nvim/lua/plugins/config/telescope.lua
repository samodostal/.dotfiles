return function()
	local telescope = safe_require("telescope")
	if not telescope then
		return
	end

	telescope.setup()
	telescope.load_extension("fzf")
end
