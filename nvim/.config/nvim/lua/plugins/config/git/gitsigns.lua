return function()
	local gitsigns = safe_require 'gitsigns'
	if not gitsigns then
		return
	end

	gitsigns.setup {
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '-', show_count = true },
			topdelete = { text = '-', show_count = true  },
			untracked = { text = '' },
		},
	}
end
