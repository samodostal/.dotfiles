return function()
	local cmp = safe_require("cmp")
	if not cmp then
		return
	end

	cmp.setup({
		snippet = {},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "copilot" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "npm" },
		}),
	})
end
