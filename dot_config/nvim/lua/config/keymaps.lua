-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "i", "c" }, [[<C-j>]], [[<Plug>(skkeleton-toggle)]], { noremap = false })
vim.keymap.set({ "i", "c" }, [[<A-n>]], "<cmd>call pum#map#insert_relative(+1)<CR>")
vim.keymap.set({ "i", "c" }, [[<A-p>]], "<cmd>call pum#map#insert_relative(-1)<CR>")
vim.keymap.set({ "i", "c" }, [[<C-y>]], "<cmd>call pum#map#confirm()<CR>")
vim.keymap.set({ "i", "c" }, [[<C-e>]], "<cmd>call pum#map#cancel()<CR>")
vim.keymap.set({ "i", "c" }, [[<PageDown>]], "<cmd>call pum#map#insert_relative_page(+1)<CR>")
vim.keymap.set({ "i", "c" }, [[<PageUp>]], "<cmd>call pum#map#insert_relative_page(-1)<CR>")
vim.keymap.set({ "i", "c" }, [[<C-a>]], "<Home>")
vim.keymap.set({ "i", "c" }, [[<C-e>]], "<End>")
vim.keymap.set({ "i", "c" }, [[<C-b>]], "<Left>")
vim.keymap.set({ "i", "c" }, [[<C-f>]], "<Right>")
vim.keymap.set({ "i", "c" }, [[<C-p>]], "<Up>")
vim.keymap.set({ "i", "c" }, [[<C-n>]], "<Down>")
vim.keymap.set({ "i", "c" }, [[<C-d>]], "<Delete>")
--vim.keymap.set({ "i", "c" }, "<ESC>", "<C-g>")

--local ls = require("luasnip")
--
--vim.keymap.set({ "i" }, "<C-K>", function()
--  ls.expand()
--end, { silent = true })
--vim.keymap.set({ "i", "s" }, "<C-L>", function()
--  ls.jump(1)
--end, { silent = true })
--vim.keymap.set({ "i", "s" }, "<C-J>", function()
--  ls.jump(-1)
--end, { silent = true })
--
--vim.keymap.set({ "i", "s" }, "<C-E>", function()
--  if ls.choice_active() then
--    ls.change_choice(1)
--  end
--end, { silent = true })
