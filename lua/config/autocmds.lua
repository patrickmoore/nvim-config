-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Set tabstop for specific files
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "cpp",
    "c",
    "hpp",
    "h",
    "csharp",
    "py",
    "pyi",
    "js",
  },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})
