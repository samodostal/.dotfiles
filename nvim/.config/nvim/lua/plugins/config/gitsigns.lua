return function ()
	local gitsigns = safe_require("gitsigns")
	if not gitsigns then
		return
	end

	gitsigns.setup()
end
