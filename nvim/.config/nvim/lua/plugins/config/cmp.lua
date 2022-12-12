return function()
	local cmp = safe_require 'cmp'
	local lspkind = safe_require 'lspkind'
	local luasnip = safe_require 'luasnip'
	local cmp_autopairs = safe_require 'nvim-autopairs.completion.cmp'

	if not cmp or not lspkind or not luasnip or not cmp_autopairs then
		return
	end

	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

	require('luasnip.loaders.from_vscode').lazy_load()

	cmp.setup.cmdline(':', {
		sources = {
			{ name = 'cmdline' },
		},
	})

	cmp.setup.cmdline('/', {
		sources = {
			{ name = 'buffer' },
		},
	})

	cmp.setup {
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = {
				border = 'rounded',
			},
			documentation = {
				border = 'rounded',
			},
		},
		mapping = cmp.mapping.preset.insert {
			['<CR>'] = cmp.mapping.confirm { select = true },
			['<C-n>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
				else
					fallback()
				end
			end, { 'i', 's' }),

			['<C-p>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
				else
					fallback()
				end
			end, { 'i', 's' }),
			['<C-q>'] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			},
		},
		sources = cmp.config.sources {
			{ name = 'nvim_lua' },
			{ name = 'nvim_lsp' },
			{ name = 'neorg' },
			{ name = 'path' },
			{ name = 'luasnip' },
			{ name = 'buffer', keyword_length = 5 },
		},
		sorting = {
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,

				function(entry1, entry2)
					local _, entry1_under = entry1.completion_item.label:find '^_+'
					local _, entry2_under = entry2.completion_item.label:find '^_+'
					entry1_under = entry1_under or 0
					entry2_under = entry2_under or 0
					if entry1_under > entry2_under then
						return false
					elseif entry1_under < entry2_under then
						return true
					end
				end,

				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
		formatting = {
			format = lspkind.cmp_format {
				with_text = true,
				menu = {
					buffer = '[buf]',
					nvim_lsp = '[LSP]',
					nvim_lua = '[api]',
					path = '[path]',
					luasnip = '[snip]',
				},
			},
		},
	}
end
