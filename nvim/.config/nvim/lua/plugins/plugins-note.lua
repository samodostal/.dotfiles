local conf = require('core.utils').plugin_conf

return {
	{
		'nvim-neorg/neorg',
		requires = {
			{ 'folke/zen-mode.nvim' },
			{ 'michaelb/sniprun', run = 'bash ./install.sh' },
		},
		config = conf 'neorg',
	},
}
