return {
  -- You can disable default plugins as follows:
  -- ["goolord/alpha-nvim"] = { disable = true },

  -- You can also add new plugins here as well:
  -- Add plugins, the packer syntax without the "use"
  -- { "andweeb/presence.nvim" },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  -- We also support a key value style plugin definition similar to NvChad:
  -- ["ray-x/lsp_signature.nvim"] = {
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    as = "tokyonight",
    config = function() vim.cmd [[colorscheme tokyonight]] end,
  },
  { "tpope/vim-abolish" },
  { "tpope/vim-surround" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-repeat" },
  { "machakann/vim-highlightedyank" },
  { "jeetsukumaran/vim-indentwise" },
  { "mg979/vim-visual-multi" },
  { "michaeljsmith/vim-indent-object" },
  ["ggandor/leap.nvim"] = require "user.plugins.leap",
  ["ggandor/leap-spooky.nvim"] = require "user.plugins.leap-spooky",
  ["ggandor/flit.nvim"] = require "user.plugins.flit",
  -- Sticky scroll similar to VSCode's implementation
  -- see: https://www.youtube.com/shorts/znue7UqdUf0
  {
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    config = function() require("treesitter-context").setup() end,
  },
}
