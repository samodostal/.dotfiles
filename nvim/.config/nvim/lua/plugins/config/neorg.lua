return function()
	local neorg = safe_require 'neorg'
	local zen_mode = safe_require 'zen-mode'

	if not neorg or not zen_mode then
		return
	end

	zen_mode.setup {}

	neorg.setup {
		load = {
			['core.defaults'] = {},
			-- ['core.norg.esupports.metagen'] = {
			-- 	config = {
			-- 		type = 'auto',
			-- 		tab = '	',
			-- 	},
			-- },
			-- ['core.norg.concealer'] = {
			-- 	config = {
			-- 		folds = false,
			-- 	},
			-- },
			-- ['core.norg.completion'] = {
			-- 	config = {
			-- 		engine = 'nvim-cmp',
			-- 	},
			-- },
			-- ['core.presenter'] = {
			-- 	config = {
			-- 		zen_mode = 'zen-mode',
			-- 	},
			-- },
			-- ['core.integrations.nvim-cmp'] = {},
			-- ['core.norg.dirman'] = {
			-- 	config = {
			-- 		workspaces = {
			-- 			muni = '~/OneDrive/notes/muni',
			-- 			work = '~/OneDrive/notes/work',
			-- 			home = '~/OneDrive/notes/home',
			-- 		},
			-- 	},
			-- },
		},
	}
end
