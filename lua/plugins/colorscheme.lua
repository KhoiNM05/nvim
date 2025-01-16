return {
  {
    "neanias/everforest-nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("everforest")
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
