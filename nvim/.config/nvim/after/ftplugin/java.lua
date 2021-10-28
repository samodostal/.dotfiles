local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local bundles = {
  vim.fn.glob("~/.config/nvim/after/dap-adapters/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
}

vim.list_extend(bundles, vim.split(vim.fn.glob("~/.config/nvim/after/dap-adapters/vscode-java-test/server/*.jar"), "\n"))

local config = {
  cmd = {
    '/usr/bin/java',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.level=ALL',
    '-Xmx1G',
    '-jar', vim.fn.glob('~/.local/share/lsp/jdtls-server/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'),
    '-configuration', vim.fn.glob('~/.local/share/lsp/jdtls-server/config_mac'),
    '-data', vim.fn.glob('~/.workspace/') .. workspace_dir,
    '--add-modules=ALL-SYSTEM',
    '--add-opens java.base/java.util=ALL-UNNAMED',
    '--add-opens java.base/java.lang=ALL-UNNAM'
  },
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'package.bluej'}),
  init_options = {
    bundles = bundles
  },
  on_attach = function(client, bufnr)
    require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require('jdtls.dap').setup_dap_main_class_configs()
  end
}

require('jdtls').start_or_attach(config)

-- Junit tests:
-- https://github.com/mfussenegger/nvim-jdtls#vscode-java-test-installation

local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local actionState = require'telescope.actions.state'
local pickers = require'telescope.pickers'
require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
  local opts = {}
  pickers.new(opts, {
    prompt_title = prompt,
    finder    = finders.new_table {
      results = items,
      entry_maker = function(entry)
        return {
          value = entry,
          display = label_fn(entry),
          ordinal = label_fn(entry),
        }
      end,
    },
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = actionState.get_selected_entry(prompt_bufnr)
        actions.close(prompt_bufnr)

        cb(selection.value)
      end)

      return true
    end,
  }):find()
end
