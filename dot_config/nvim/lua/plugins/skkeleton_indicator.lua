return {
  --{ "delphinus/skkeleton_indicator.nvim", opts = { fadeOutMs = 1000 } },
  {
    "delphinus/skkeleton_indicator.nvim",
    opts = { fadeOutMs = 500 },
    config = function()
      vim.cmd([[ lua require("skkeleton_indicator").setup{}]])
    end,
  },
}
