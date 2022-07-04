return function()
	local copilot = safe_require("copilot")
	if not copilot then
		return
	end

	vim.schedule(function()
		copilot.setup()
	end)
end
