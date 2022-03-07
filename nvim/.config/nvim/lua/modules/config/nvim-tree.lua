return function()
	local map = require("nvim-tree.config").nvim_tree_callback
	local tree_opts = require("nvim-tree.view").View.winopts

	tree_opts.cursorline = true

	require("nvim-tree").setup({
		disable_netrw = true,
		open_on_setup = true,
		ignore_buffer_on_setup = true,
		ignore_ft_on_setup = {},
		auto_close = true,
		auto_reload_on_write = true,
		open_on_tab = false,
		hijack_cursor = true,
		update_cwd = false,
		hijack_unnamed_buffer_when_opening = true,
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		diagnostics = {
			enable = false,
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {
				"notify",
				"packer",
				"qf",
				"diff",
				"fugitive",
				"fugitiveblame",
				".git",
				".git/*",
				"node_modules",
				".cache",
				".next",
				"*.out",
			},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		filters = {
			dotfiles = false,
			custom = {},
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 500,
		},
		view = {
			width = 35,
			height = 30,
			hide_root_folder = false,
			side = "left",
			auto_resize = true,
			preserve_window_proportions = false,
			mappings = {
				mappings = {
					custom_only = false,
					list = {
						{ key = "<C-R>", cb = map("refresh") },
						{ key = "a", cb = map("create") },
						{ key = "d", cb = map("remove") },
						{ key = "h", cb = map("close_node") },
						{ key = ".", cb = map("toggle_ignored") },
						{ key = "l", cb = map("edit") },
						{ key = "r", cb = map("rename") },
						{ key = "s", cb = map("split") },
						{ key = "v", cb = map("vsplit") },
						{ key = "Y", cb = map("copy_path") },
						{ key = "y", cb = map("copy_name") },
					},
				},
			},
			number = true,
			relativenumber = true,
			signcolumn = "no",
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
		actions = {
			change_dir = {
				enable = true,
				global = false,
			},
			open_file = {
				quit_on_open = false,
				window_picker = {
					enable = true,
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
		},
	})
end
