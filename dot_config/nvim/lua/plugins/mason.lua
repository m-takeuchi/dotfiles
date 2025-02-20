return {
  -- add tinymist to lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          settings = {
            exportPdf = "onType",
            --outputPath = "$root/target/$dir/$name",
          },
        },
      },
    },
  },
}
