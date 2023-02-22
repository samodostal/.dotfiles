return function()
	local telescope = safe_require 'telescope'
	if not telescope then
		return
	end

	local actions = require 'telescope.actions'

	telescope.setup {
		defaults = {
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--hidden',
			},
			sorting_strategy = 'ascending',
			layout_config = {
				vertical = {
					mirror = true,
				},
				prompt_position = 'top',
			},
			file_ignore_patterns = {
				'dist/.*',
				'%.git/.*',
				'%.vim/.*',
				'node_modules/.*',
				'%.idea/.*',
				'%.vscode/.*',
				'%.history/.*',
			},
			mappings = {
				i = {
					['<C-a>'] = actions.select_all,
					['<C-q>'] = actions.send_selected_to_qflist,
				},
			},
		},
	}

	telescope.load_extension 'fzf'
	telescope.load_extension 'yank_history'
	telescope.load_extension 'frecency'
end
