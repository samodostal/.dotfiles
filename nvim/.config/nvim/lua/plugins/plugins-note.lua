local conf = require('core.utils').plugin_conf

return {
	{
		'nvim-neorg/neorg',
		build = ':Neorg sync-parsers',
		config = function()
			require('neorg').setup {
				load = {
					['core.defaults'] = {},
					['core.concealer'] = {},
					['core.esupports.indent'] = {},
					['core.esupports.hop'] = {
						config = {
							external_filetypes = { 'pdf' },
						},
					},
					['core.completion'] = {
						config = {
							engine = 'nvim-cmp',
						},
					},
					['core.dirman'] = {},
				},
			}

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},
}
