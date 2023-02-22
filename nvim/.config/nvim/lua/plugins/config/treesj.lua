return function()
	local treesj = safe_require 'treesj'
	if not treesj then
		return
	end

	treesj.setup {
		use_default_keymaps = false,
	}
end
