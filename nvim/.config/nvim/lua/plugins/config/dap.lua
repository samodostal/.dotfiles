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
	dap.configurations.typescript = {
		{
			name = 'Attach to process', -- Start process with `--inspect` flag
			type = 'node2',
			request = 'attach',
			processId = function()
				pick_process_filter 'node'
			end,
		},
	}
end
