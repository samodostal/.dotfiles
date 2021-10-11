local M = {}

function P(cmd)
  print(vim.inspect(cmd))
end

-- Os
M.os = {
  home = os.getenv 'HOME',
  data = vim.fn.stdpath 'data',
  cache = vim.fn.stdpath 'cache',
  config = vim.fn.stdpath 'config',
  name = vim.loop.os_uname().sysname,
  is_git_dir = os.execute 'git rev-parse --is-inside-work-tree >> /dev/null 2>&1',
}

local is_transparent = true
function Toggle_background()
  if is_transparent == true then
    vim.cmd [[ hi Normal guibg=NONE ctermbg=NONE ]]
    is_transparent = false
  else
    vim.cmd [[ set background=dark ]]
    is_transparent = true
  end
end

-- Mappings
M.keymap = {}

local options = { noremap = true, silent = true }

function M.keymap.buf_map(mode, key, cmd, opts)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, opts or options)
end

function M.keymap.map(mode, key, cmd, opts)
  vim.api.nvim_set_keymap(mode, key, cmd, opts or options)
end

return M
