return function()
  safe_require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
    }
  }
end
