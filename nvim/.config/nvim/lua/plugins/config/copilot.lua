return function()
	vim.defer_fn(function()
		local copilot = require 'copilot'

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

	local api = require 'copilot.api'
	api.register_status_notification_handler(function(data)
		vim.api.nvim_set_var('copilot_status', data.status)
	end)
end
