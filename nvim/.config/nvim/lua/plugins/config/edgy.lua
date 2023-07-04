return function()
	local edgy = safe_require 'edgy'
	if not edgy then
		return
	end

	edgy.setup {
		animate = { enabled = false },
		wo = { winbar = false },
		exit_when_last = true,
		left = {
			{
				title = 'File tree',
				ft = 'NvimTree',
				size = { height = 0.6 },
				open = 'NvimTreeOpen',
				pinned = true,
				wo = { winbar = "%s" }
			},
			{
				title = 'Symbols',
				ft = 'aerial',
				size = { height = 0.4 },
				open = 'AerialOpen',
				pinned = true,
			},
		},
	}
end
