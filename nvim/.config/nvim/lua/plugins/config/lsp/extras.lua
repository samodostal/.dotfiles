return function()
	local lsp_signature = safe_require 'lsp_signature'
	local inlayhints = safe_require 'lsp-inlayhints'

	if not lsp_signature or not inlayhints then
		return
	end

	lsp_signature.setup {
		floating_window = false,
		hint_prefix = '',
	}

	inlayhints.setup()
end
