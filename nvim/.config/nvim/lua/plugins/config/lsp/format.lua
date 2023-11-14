return function()
	local conform = safe_require 'conform'
	if not conform then
		return
	end

	-- Formatters installed with Mason, 'bin/'s for formatters automatically added to $PATH on neovim start

	local formatters_with_ft = require('plugins.config.mason.packages').formatters_with_ft

	conform.setup {
		format_on_save = {
			timeout_ms = 100,
		},
		formatters_by_ft = formatters_with_ft,
	}
end
