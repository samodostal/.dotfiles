return function()
	local neorg = safe_require 'neorg'
	if not neorg then
		return
	end

	neorg.setup {
		load = {
			['core.defaults'] = {},
			['core.norg.concealer'] = {},
			['core.norg.dirman'] = {
				config = {
					workspaces = {
						muni = '~/OneDrive/notes/muni',
						work = '~/OneDrive/notes/work',
						home = '~/OneDrive/notes/home',
					},
				},
			},
		},
	}
end
