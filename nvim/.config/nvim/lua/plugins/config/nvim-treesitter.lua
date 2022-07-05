return function()
	local treesitter = safe_require 'nvim-treesitter.configs'
	if not treesitter then
		return
	end

	treesitter.setup {
		highlight = {
			enable = true,
		},
		context_commentstring = {
			enable = true,
		},
	}
end
