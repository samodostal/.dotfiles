return function()
  require("dapui").setup({
    icons = { expanded = "?", collapsed = "?" },
    mappings = {
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
    },
    sidebar = {
      elements = {
        {
          id = "scopes",
          size = 0.25,
        },
        { id = "watches", size = 00.25 },
        { id = "stacks", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    tray = {
      elements = { "repl" },
      size = 15,
      position = "bottom",
    },
    floating = {
      max_height = nil,
      max_width = nil,
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
  })
end
