local harpoon = require("harpoon")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
harpoon:setup()

vim.keymap.set("n", "<C-t>", "<cmd>set shell=bash\\ -l<bar>term<cr>", { desc = "Open terminal" })
-- vim.keymap.set("n", "<leader>ee", "<cmd>Neotree right toggle<cr>", { desc = "Open file tree" })
vim.keymap.set("n", "<leader>gS", "<cmd>Neotree git_status toggle<cr>", { desc = "Open git status file tree" })
vim.keymap.set("n", "<leader>ev", "<cmd>Neotree<bar>e $HOME/AppData/Local/nvim<cr>", { desc = "Open nvim dir" })
vim.keymap.set("n", "<leader>ep", "<cmd>Neotree<bar>e D:/projects/<cr>", { desc = "Open projects dir" })
vim.keymap.set("n", "<leader>ed", "<cmd>cd %:p:h<cr>", { desc = "Set cwd" })
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<cr>", { desc = "File Explorer" })
vim.keymap.set("n", "G", "Gzz", { desc = "Last line and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center" })
vim.keymap.set("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tt", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Tab close" })
vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<cr>", { desc = "Tab prev" })
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<cr>", { desc = "Tab next" })
vim.keymap.set("n", "<leader>ta", "<cmd>tabnew<cr>", { desc = "Tab new" })
vim.keymap.set("n", "<tab>D", "<cmd>tabclose<cr>", { desc = "Tab close" })
vim.keymap.set("n", "<tab>h", "<cmd>tabprevious<cr>", { desc = "Tab prev" })
vim.keymap.set("n", "<tab>l", "<cmd>tabnext<cr>", { desc = "Tab next" })
vim.keymap.set("n", "<tab>a", "<cmd>tabnew<cr>", { desc = "Tab new" })
vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():append()
end, { desc = "Harpoon Mark" })
vim.keymap.set("n", "<leader>he", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon UI" })
vim.keymap.set("n", "<leader>h1", function()
  harpoon:list():select(1)
end, { desc = "Harpoon Go To Mark 1" })
vim.keymap.set("n", "<leader>h2", function()
  harpoon:list():select(2)
end, { desc = "Harpoon Go To Mark 2" })
vim.keymap.set("n", "<leader>h3", function()
  harpoon:list():select(3)
end, { desc = "Harpoon Go To Mark 3" })
vim.keymap.set("n", "<leader>h4", function()
  harpoon:list():select(4)
end, { desc = "Harpoon Go To Mark 4" })
vim.keymap.set("n", "<leader>h5", function()
  harpoon:list():select(5)
end, { desc = "Harpoon Go To Mark 5" })