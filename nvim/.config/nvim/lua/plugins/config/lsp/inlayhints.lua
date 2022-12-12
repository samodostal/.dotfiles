return function ()
	local inlayhints = safe_require 'lsp-inlayhints'
	if not inlayhints then return end

	inlayhints.setup()
end
