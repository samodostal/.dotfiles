return function()
	local cmp = safe_require 'cmp'
	local lspkind = safe_require 'lspkind'
	local luasnip = safe_require 'luasnip'

	if not cmp or not lspkind or not luasnip then
		return
	end

	require('luasnip.loaders.from_vscode').lazy_load()

	cmp.setup {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {},
		mapping = cmp.mapping.preset.insert {
			['<CR>'] = cmp.mapping.confirm { select = true },
			['<C-n>'] = cmp.mapping(function(fallback)
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				elseif cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { 'i', 's' }),

			['<C-p>'] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				elseif cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { 'i', 's' }),
		},
		sources = cmp.config.sources {
			{ name = 'nvim_lsp' },
			{ name = 'neorg' },
			{ name = 'nvim_lua' },
			{ name = 'luasnip' },
			{ name = 'path' },
			{ name = 'buffer' },
			{ name = 'npm' },
		},
		formatting = {
			format = lspkind.cmp_format { with_text = true, maxwidth = 50 },
		},
	}
end
