-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Encodings and File settings
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "ucs-bom", "iso-2022-jp", "euc-jp", "sjis", "utf-8" }
vim.opt.fileformats = { "unix", "dos", "mac" }
----vim.opt.ambiwidth = 'double'
--
-- Clipboard
vim.o.clipboard = "unnamedplus"
-- Floating windows にはボーダーをつける
vim.opt.winborder = "rounded"
