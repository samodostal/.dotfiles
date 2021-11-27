return function()
	local map = require("nvim-tree.config").nvim_tree_callback
	local tree_opts = require("nvim-tree.view").View.winopts

	tree_opts.signcolumn = "no"
	tree_opts.number = true
	tree_opts.relativenumber = true
	tree_opts.cursorline = true

	require("nvim-tree").setup({
		update_to_buf_dir = {
			enable = true,
			auto_open = true,
		},
		open_on_setup = true,
		view = {
			width = 35,
			side = "left",
			auto_resize = true,
			mappings = {
				custom_only = false,
				list = {
					{ key = "<C-R>", cb = map("refresh") },
					{ key = "a", cb = map("create") },
					{ key = "d", cb = map("remove") },
					{ key = "h", cb = map("close_node") },
					{ key = "I", cb = map("toggle_ignored") },
					{ key = "l", cb = map("edit") },
					{ key = "r", cb = map("rename") },
					{ key = "s", cb = map("split") },
					{ key = "v", cb = map("vsplit") },
					{ key = "Y", cb = map("copy_path") },
					{ key = "y", cb = map("copy_name") },
				},
			},
		},
	})
end
