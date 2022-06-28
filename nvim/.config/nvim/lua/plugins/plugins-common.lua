local conf = require'core.utils'.plugin_conf

return {
  -----[[------------]]-----
  ---       General      ---
  -----]]------------[[-----

  {
    "nvim-treesitter/nvim-treesitter",
    config = "nvim-treesitter",
    requires = {
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  },

  -----[[------------]]-----
  ---       Theme        ---
  -----]]------------[[-----

  { "sainnhe/gruvbox-material" },
  { "norcalli/nvim-colorizer.lua", config = "nvim-colorizer", },

  -----[[------------]]-----
  ---      TPope <3      ---
  -----]]------------[[-----

  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "tpope/vim-abolish" },
  { "tpope/vim-sleuth" },
  { "tpope/vim-vinegar" },
  { "tpope/vim-eunuch" },

  -----[[------------]]-----
  ---        Other       ---
  -----]]------------[[-----

  { "christoomey/vim-tmux-navigator" },
}
