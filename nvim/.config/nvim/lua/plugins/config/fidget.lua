return function()
	local fidget = safe_require 'fidget'
	if not fidget then
		return
	end

	fidget.setup {
		notification = {
			window = {
				winblend = 0,
				y_padding = 9,
			},
		},
	}
end
