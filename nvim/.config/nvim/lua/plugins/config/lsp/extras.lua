return function()
	local lsp_signature = safe_require 'lsp_signature'
	local inlayhints = safe_require 'lsp-inlayhints'
	local diaglist = safe_require 'diaglist'

	if not lsp_signature or not inlayhints or not diaglist then
		return
	end

	lsp_signature.setup {
		floating_window = false,
		hint_prefix = '',
	}

	inlayhints.setup()

	diaglist.init()
	diaglist.open_all_diagnostics()
end
