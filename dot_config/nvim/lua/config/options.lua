-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Encodings and File settings
vim.opt.encoding = "utf8"
vim.opt.fileencoding = "utf8"
vim.opt.fileencodings = { "utf8", "ucs-bom", "iso-2022-jp", "euc-jp", "sjis" }
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.scriptencoding = "utf8"
---vim.opt.ambiwidth = 'double'
--
-- Clipboard
vim.o.clipboard = "unnamedplus"
-- Floating windows
vim.opt.winborder = "rounded"
