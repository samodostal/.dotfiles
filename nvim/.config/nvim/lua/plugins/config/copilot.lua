return function()
	local copilot = safe_require 'copilot'
	local copilot_client = safe_require 'copilot-client'

	if not copilot or not copilot_client then
		return
	end

	copilot.setup {
		cmp = {
			enabled = false,
		},
	}

	copilot_client.setup {
		mapping = {
			accept = '<CR>',
			-- suggest_next = '<C-n>',
			-- suggest_prev = '<C-p>',
		},
	}
end
