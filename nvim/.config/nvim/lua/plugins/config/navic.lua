return function()
	local navic = safe_require 'nvim-navic'
	if not navic then
		return
	end

	navic.setup {
		highlight = true,
	}
end
