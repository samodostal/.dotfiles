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
	dap.configurations.typescriptreact = dap.configurations.typescript
	dap.configurations.javascript = dap.configurations.typescript
  dap.configurations.javascriptreact = dap.configurations.typescript
end
