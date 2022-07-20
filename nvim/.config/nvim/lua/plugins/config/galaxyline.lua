return function()
	local galaxyline = safe_require 'galaxyline'
	if not galaxyline then
		return
	end

	local gls = galaxyline.section
	local condition = require 'galaxyline.condition'

	local colors = {
		bg = '#303030',
		yellow = '#d79921',
		cyan = '#83a598',
		green = '#b8bb26',
		orange = '#d65d0e',
		purple = '#b16286',
		magenta = '#d3869b',
		grey = '#a89984',
		blue = '#076678',
		red = '#cc241d',
	}

	gls.left = {
		{
			GitIcon = {
				provider = function()
					return '  '
				end,
				condition = condition.check_git_workspace,
				separator = ' ',
				separator_highlight = { 'NONE', colors.bg },
				highlight = { colors.orange, colors.bg, 'bold' },
			},
		},
		{
			GitBranch = {
				provider = 'GitBranch',
				condition = condition.check_git_workspace,
				separator = '  ',
				separator_highlight = { 'NONE', colors.bg },
				highlight = { colors.yellow, colors.bg, 'bold' },
			},
		},
		{
			Harpoon = {
				provider = safe_require('harpoon.mark').status,
				separator = '  ',
				highlight = { colors.white, colors.bg, 'bold' },
				separator_highlight = { 'NONE', colors.bg },
			},
		},
		{
			DiffAdd = {
				provider = 'DiffAdd',
				icon = '  ',
				highlight = { colors.green, colors.bg },
			},
		},
		{
			DiffModified = {
				provider = 'DiffModified',
				icon = ' 柳',
				highlight = { colors.blue, colors.bg },
			},
		},
		{
			DiffRemove = {
				provider = 'DiffRemove',
				icon = '  ',
				highlight = { colors.red, colors.bg },
			},
		},
	}

	gls.right = {
		-- {
		-- 	IsPrimeOnline = {
		-- 		provider = function()
		-- 			local status = safe_require("is-prime-online").status()
		-- 			if status == true then
		-- 				return "🟢 Prime is online!  "
		-- 			elseif status == false then
		-- 				return "🔴 Prime is offline.  "
		-- 			else
		-- 				return "🟠 Status syncing...  "
		-- 			end
		-- 		end,
		-- 		separator = " ",
		-- 		highlight = { colors.gray, colors.bg, "bold" },
		-- 		separator_highlight = { "NONE", colors.bg },
		-- 	},
		-- },
		{
			LineInfo = {
				provider = 'LineColumn',
				separator = '  ',
				separator_highlight = { 'NONE', colors.bg },
				highlight = { colors.grey, colors.bg },
			},
		},
		{
			PerCent = {
				provider = 'LinePercent',
				separator = ' ',
				separator_highlight = { 'NONE', colors.bg },
				highlight = { colors.grey, colors.bg, 'bold' },
			},
		},
	}
end
