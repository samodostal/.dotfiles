return function()
	local cmp = safe_require 'cmp'
	local lspkind = safe_require 'lspkind'

	if not cmp then
		return
	end

	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' },
		},
	})

	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'cmdline' },
			{ name = 'path' },
		},
	})

	cmp.setup {
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
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
			-- ['<C-r>'] = cmp.mapping.confirm {
			-- 	behavior = cmp.ConfirmBehavior.Replace,
			-- 	select = true,
			-- },
		},
		snippet = {
			expand = function(args)
				require('snippy').expand_snippet(args.body)
			end,
		},
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'neorg' },
			{ name = 'path' },
			{ name = 'buffer' },
		}, {
			{ name = 'snippy' },
		}),
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
			format = lspkind.cmp_format({
				mode = 'symbol',
				maxwidth = 50,
				ellipsis_char = '...',
			}),
		},
		enabled = function()
			if vim.api.nvim_get_mode().mode == 'c' then
				return true
			else
				local context = require 'cmp.config.context'
				return not context.in_treesitter_capture 'comment' and not context.in_syntax_group 'Comment'
			end
		end,
	}
end
