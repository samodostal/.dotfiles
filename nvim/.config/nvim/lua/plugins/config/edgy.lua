return function()
	local edgy = safe_require 'edgy'
	if not edgy then
		return
	end

	edgy.setup {
		options = { bottom = { size = 8 } },
		animate = { enabled = false },
		wo = { winbar = false },
		exit_when_last = true,
		left = {
			{
				ft = 'NvimTree',
				size = { height = 0.6 },
				pinned = false,
			},
			{
				ft = 'aerial',
				size = { height = 0.4 },
				pinned = false,
			},
		},
		bottom = {
			{
				title = 'QuickFix',
				ft = 'qf',
				size = { height = 0.1 },
				pinned = false,
				wo = { winbar = ' QuickFix' },
			},
		},
	}
end
