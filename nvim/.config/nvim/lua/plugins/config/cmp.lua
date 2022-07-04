return function()
	local cmp = safe_require("cmp")
	local lspkind = safe_require("lspkind")

	if not cmp or not lspkind then
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
		formatting = {
			format = function(entry, vim_item)
				if entry.source.name == "copilot" then
					vim_item.kind = " Copilot"
					vim_item.kind_hl_group = "CmpItemKindCopilot"
					return vim_item
				end
				return lspkind.cmp_format({ with_text = true, maxwidth = 50 })(entry, vim_item)
			end,
		},
	})
end
