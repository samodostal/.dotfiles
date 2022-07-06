return function()
	local autotag = safe_require("nvim-ts-autotag")
	if not autotag then
		return
	end

	autotag.setup()
end
