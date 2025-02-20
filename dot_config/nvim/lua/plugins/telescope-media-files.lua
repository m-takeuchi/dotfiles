return {
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependancies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },
}
