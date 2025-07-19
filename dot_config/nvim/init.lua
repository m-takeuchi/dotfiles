-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- -- transparency for tokyonight theme
-- require("tokyonight").setup({
--   transparent = true,
--   styles = {
--     sidebars = "transparent",
--     floats = "transparent",
--   },
-- })
--vim.cmd([[colorscheme tokyonight-night]])
vim.o.clipboard = "unnamedplus"
