-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_custom_" .. name, { clear = true })
end

vim.opt.title = true
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.scrolloff = 15

vim.api.nvim_create_autocmd({ "InsertEnter", "BufFilePre", "TextChanged", "TextChangedI" }, {
  group = augroup("title_rename"),
  callback = function()
    vim.opt.titlestring = "nvim"
  end,
})
