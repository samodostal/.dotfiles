return function()
  require('nvim-autopairs').setup {}
  require('nvim-autopairs.completion.cmp').setup {
    map_cr = true,
    map_complete = true,
    auto_select = true,
  }
end