return function()
	local cmp = safe_require 'cmp'
	local lspkind = safe_require 'lspkind'
	local cmp_autopairs = safe_require 'nvim-autopairs.completion.cmp'

	if not cmp or not lspkind or not cmp_autopairs then
		return
	end

	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

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
		snippet = {
			expand = function(args)
				require('snippy').expand_snippet(args.body)
			end,
		},
		sources = cmp.config.sources {
			{ name = 'nvim_lsp' },
			{ name = 'snippy' },
			{ name = 'path' },
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
				mode = 'symbol',
				with_text = true,
				menu = {
					nvim_lsp = '[lsp]',
					snippy = '[snip]',
					path = '[path]',
					buffer = '[buf]',
				},
			},
		},
		enabled = function()
			local context = require 'cmp.config.context'
			if vim.api.nvim_get_mode().mode == 'c' then
				return true
			else
				return not context.in_treesitter_capture 'comment' and not context.in_syntax_group 'Comment'
			end
		end,
	}
end
