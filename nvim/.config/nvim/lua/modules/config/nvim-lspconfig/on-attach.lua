return function(client)
	vim.opt.omnifunc = "v:lua.vim.lsp.omnifunc"

	-- local lsp_signature = safe_require("lsp_signature")
	-- if lsp_signature then
	-- 	lsp_signature.on_attach({
	-- 		bind = true,
	-- 		hint_enable = false,
	-- 	})
	-- end

	if client.name == "tsserver" then
		-- local ts_utils = safe_require("nvim-lsp-ts-utils")
		-- if ts_utils then
		-- 	ts_utils.setup({})
		-- 	ts_utils.setup_client(client)
		-- end
	end

	-- So that the only client with format capabilities is efm
	if client.name ~= "efm" then
		client.resolved_capabilities.document_formatting = false
	end
end
