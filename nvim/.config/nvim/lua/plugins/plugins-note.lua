local conf = require('core.utils').plugin_conf

return {
	{
		'nvim-neorg/neorg',
		requires = {
			{ 'folke/zen-mode.nvim' },
		},
		config = conf 'neorg',
	},
}
