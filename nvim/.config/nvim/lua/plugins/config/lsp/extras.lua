return function()
	local inlayhints = safe_require 'lsp-inlayhints'
	local diaglist = safe_require 'diaglist'

	if not inlayhints or not diaglist then
		return
	end

	inlayhints.setup()

	-- diaglist.init()
	-- diaglist.open_all_diagnostics()
end
