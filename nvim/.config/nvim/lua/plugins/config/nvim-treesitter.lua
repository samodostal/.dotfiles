return function()
	local treesitter = safe_require 'nvim-treesitter.configs'
	if not treesitter then
		return
	end

	treesitter.setup {
		ensure_installed = 'all',
		highlight = {
			enable = true,
		},
		context_commentstring = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	}
end
