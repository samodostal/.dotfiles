return function()
	local neodev = safe_require 'neodev'
	if not neodev then
		return
	end

	neodev.setup {
		library = {
			enabled = true,
			runtime = true,
			types = true,
			plugins = true,
		},
		setup_jsonls = true,
		override = function() end,
		lspconfig = true,
		pathStrict = true,
	}
end
