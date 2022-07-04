return function()
	local copilot = safe_require("copilot")
	if not copilot then
		return
	end

	copilot.setup({
		cmp = {
			enabled = true,
			method = "getCompletionsCycling",
 	 	  plugin_manager_path = vim.fn.stdpath("data") .. "/site/commoncode/packer", 
		},
	})
end
