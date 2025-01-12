-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load LazyVim
require("lazy").setup({
  spec = {
    {"LazyVim/LazyVim", import = "LazyVim.plugins" },
    { import = "LazyVim.plugins.extras.linting.eslint" },
    { import = "LazyVim.plugins.extras.formatting.prettier" },
    {import = "plugins"},
    {import = "plugins/*"},
  },
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight", "gruvbox", "catppuccin" } },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

