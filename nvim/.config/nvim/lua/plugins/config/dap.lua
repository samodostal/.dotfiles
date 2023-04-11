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

	local pick_process_filter = function(filter)
		local processes = require('dap.utils').get_processes()
		local filtered_processes = {}

		for _, process in ipairs(processes) do
			if string.find(process.name, filter) then
				table.insert(filtered_processes, process)
			end
		end

		local label_fn = function(proc)
			return string.format('id=%d name=%s', proc.pid, proc.name)
		end

		local result = require('dap.ui').pick_one_sync(filtered_processes, 'Select process', label_fn)
		return result and result.pid or nil
	end

	-- Adapters --

	dap.adapters.go = {
		type = 'executable',
		command = 'node',
		args = { vim.fn.stdpath 'data' .. '/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js' },
	}
	dap.adapters.node2 = {
		type = 'executable',
		command = 'node',
		args = { vim.fn.stdpath 'data' .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
	}
	dap.adapters.chrome = {
		type = 'executable',
		command = 'node',
		args = { vim.fn.stdpath 'data' .. '/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' },
	}
	dap.adapters.python = {
		type = 'executable',
		command = vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python',
		args = { '-m', 'debugpy.adapter' },
	}
	dap.adapters.cppdbg = {
		id = 'cppdbg',
		type = 'executable',
		command = vim.fn.stdpath 'data' .. '/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
	}
	dap.adapters.haskell = {
		type = 'executable',
		command = 'haskell-debug-adapter',
		args = { '--hackage-version=0.0.33.0' },
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
	dap.configurations.typescriptreact = {
		{
			type = 'chrome', --remote-debugging-port=9222
			request = 'attach',
			program = '${file}',
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = 'inspector',
			port = 9222,
			webRoot = '${workspaceFolder}',
		},
	}
	dap.configurations.typescript = {
		{
			name = 'Attach to process', -- Start process with `--inspect` flag
			type = 'node2',
			request = 'attach',
			processId = function()
				pick_process_filter 'node'
			end,
		},
		dap.configurations.typescriptreact[1],
	}
	dap.configurations.python = {
		{
			type = 'python',
			request = 'launch',
			name = 'Launch file',
			program = '${file}',
			pythonPath = function()
				return vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python'
			end,
		},
	}
	dap.configurations.rust = {
		{
			name = 'Launch file',
			type = 'cppdbg',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopAtEntry = true,
		},
		{
			name = 'Attach to gdbserver :1234',
			type = 'cppdbg',
			request = 'launch',
			MIMode = 'gdb',
			miDebuggerServerAddress = 'localhost:1234',
			miDebuggerPath = '/usr/bin/gdb',
			cwd = '${workspaceFolder}',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
		},
	}
	dap.configurations.c = dap.configurations.rust
	dap.configurations.cpp = dap.configurations.rust
	dap.configurations.haskell = {
		{
			type = 'haskell',
			request = 'launch',
			name = 'Debug',
			workspace = '${workspaceFolder}',
			startup = '${file}',
			stopOnEntry = true,
			logFile = vim.fn.stdpath 'data' .. '/haskell-dap.log',
			logLevel = 'WARNING',
			ghciEnv = vim.empty_dict(),
			ghciPrompt = 'λ: ',
			ghciInitialPrompt = 'λ: ',
			ghciCmd = 'stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show',
		},
	}
end
