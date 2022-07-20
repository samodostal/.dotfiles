return function()
	local telescope = safe_require 'telescope'
	if not telescope then
		return
	end

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
		},
	}
	telescope.load_extension 'fzf'
end
