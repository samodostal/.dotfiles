require("core.utils")
require("modules"):init()
require("modules"):load(require("modules.plugins"))
require("core.options")
require("core.keymaps")
require("core.autocmd")
require("core.colors")

vim.cmd[[ let g:python3_host_prog = '/opt/homebrew/bin/python3' ]]
