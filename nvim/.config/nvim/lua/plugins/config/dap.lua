return function()
	local dap = safe_require 'dap'
	local dap_ui = safe_require 'dapui'
	if not dap or not dap_ui then
		return
	end

	dap_ui.setup()

	vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'GitSignsDelete', linehl = '', numhl = '' })
	vim.fn.sign_define('DapBreakpointCondition', { text = 'C●', texthl = 'GitSignsDelete', linehl = '', numhl = '' })
	vim.fn.sign_define('DapLogPoint', { text = '◇', texthl = 'GitSignsDelete', linehl = '', numhl = '' })
	vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'GitSignsDelete', linehl = '', numhl = '' })
	vim.fn.sign_define('DapBreakpointRejected', { text = '○', texthl = 'GitSignsChange', linehl = '', numhl = '' })

	-- Adapters --

	dap.adapters.go = {
		type = 'executable',
		command = 'node',
		args = { vim.fn.stdpath 'data' .. '/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js' },
	}

	-- Configurations --

	dap.configurations.go = {
		{
			type = 'go',
			name = 'Debug',
			request = 'launch',
			showLog = false,
			program = '${file}',
			dlvToolPath = vim.fn.exepath 'dlv',
		},
	}
end
