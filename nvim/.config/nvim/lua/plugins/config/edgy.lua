return function()
	local edgy = safe_require 'edgy'
	if not edgy then
		return
	end

	edgy.setup {
		options = { bottom = { size = 8 } },
		animate = { enabled = false },
		wo = { winbar = true },
		exit_when_last = true,
		left = {
			{
				title = 'File tree',
				ft = 'NvimTree',
				size = { height = 0.6 },
				open = 'NvimTreeOpen',
				pinned = true,
				wo = { winbar = '%=File tree%=' },
			},
			{
				title = 'Symbols',
				ft = 'aerial',
				size = { height = 0.4 },
				open = 'AerialOpen',
				pinned = true,
				wo = { winbar = '%=Symbols%=' },
			},
		},
		bottom = {
			{
				title = 'QuickFix',
				ft = 'qf',
				size = { height = 0.1 },
				open = 'copen',
				pinned = true,
				wo = { winbar = ' QuickFix' },
			},
		},
	}
end
