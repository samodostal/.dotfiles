local conf = require'core.utils'.plugin_conf

return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = conf("nvim-treesitter"),
    requires = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  },
  { "sainnhe/gruvbox-material" },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-commentary" },
}
