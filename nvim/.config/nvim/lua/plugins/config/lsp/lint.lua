return function()
	local lint = safe_require 'lint'
	if not lint then
		return
	end

	-- Linters installed with Mason, 'bin/'s for linters automatically added to $PATH on neovim start

	local linters_with_ft = require('plugins.config.mason.packages').linters_with_ft

	lint.linters_by_ft = linters_with_ft

	vim.api.nvim_create_autocmd({ 'BufReadPost', 'TextChanged' }, {
		callback = function()
			require('lint').try_lint()
		end,
	})
end
