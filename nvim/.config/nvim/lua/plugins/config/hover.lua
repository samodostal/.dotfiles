return function()
	local hover = safe_require 'hover'
	if not hover then
		return
	end

	hover.setup {
		title = false,
		init = function()
			require 'hover.providers.lsp'
			require 'hover.providers.man'
		end,
	}
end
