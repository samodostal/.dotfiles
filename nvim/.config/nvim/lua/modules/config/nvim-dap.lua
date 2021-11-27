return function()
	local dap = require("dap")

	vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint", { text = "◇", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "▸", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "", linehl = "", numhl = "" })

	dap.adapters.chrome = {
		type = "executable",
		command = "node",
		args = { os.getenv("HOME") .. "/.config/nvim/after/dap-adapters/vscode-chrome-debug/out/src/chromeDebug.js" },
	}

	dap.adapters.cppdbg = {
		type = "executable",
		command = "/Users/samueldostal/.dotfiles/nvim/.config/nvim/after/dap-adapters/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7",
	}

	dap.configurations.typescript = {
		{
			type = "chrome",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
	}

	dap.configurations.typescriptreact = {
		{
			type = "chrome",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			miDebuggerPath = "/usr/local/bin/lldb",
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
	}

	dap.configurations.cpp = {
		{
			name = "Launch file",
			type = "cppdbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
		},
		{
			name = "Attach to gdbserver :1234",
			type = "cppdbg",
			request = "launch",
			MIMode = "gdb",
			miDebuggerServerAddress = "localhost:1234",
			miDebuggerPath = "/usr/local/bin/lldb",
			cwd = "${workspaceFolder}",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
		},
	}
end
