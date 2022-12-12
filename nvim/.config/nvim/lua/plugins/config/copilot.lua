return function()
	vim.defer_fn(function()
		local copilot = safe_require 'copilot'

		if not copilot then
			return
		end

		copilot.setup {
			settings = {
				advanced = {
					inlineSuggestCount = 3,
				},
			},
			suggestion = {
				keymap = {
					accept = '<C-r>',
					next = '<C-c>',
				},
			},
		}
	end, 100)
end
