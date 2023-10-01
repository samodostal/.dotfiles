local conf = require('core.utils').plugin_conf

return {
	{
		'nvim-neorg/neorg',
		dependencies = {
			{ 'folke/zen-mode.nvim' },
		},
		config = conf 'neorg',
	},
}
