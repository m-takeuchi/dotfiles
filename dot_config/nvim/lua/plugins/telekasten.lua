return {
  -- add symbols-outline
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-treesitter" },
    event = "VimEnter",
    --opts = {
    --  --     template_new_note = "~/zettelkasten/template/template_new_note.md",
    --  uuid_type = "%Y%m%d-%H%M",
    --  template_new_daily = vim.fn.expand("~/zettelkasten_work/templates/template_new_daily.md"),
    --},
    -- telekasten settings, zettelkasten
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/zettelkasten_work"), -- Put the name of your notes directory here
        template_new_note = vim.fn.expand("~/zettelkasten/templates/template_new_note.md"),
        uuid_type = "%Y%m%d-%H%M",
        vaults = {
          personal = {
            -- configuration for personal vault. E.g.:
            home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
          },
          work = {
            home = vim.fn.expand("~/zettelkasten_work"),
            dailies = vim.fn.expand("~/zettelkasten_work/lognote"),
            weeklies = vim.fn.expand("~/zettelkasten_work/lognote"),
            template_new_note = vim.fn.expand("~/zettelkasten_work/templates/template_new_note.md"),
            template_daily_note = vim.fn.expand("~/zettelkasten_work/templates/template_daily_note.md"),
            template_weekly_note = vim.fn.expand("~/zettelkasten_work/templates/template_weekly_note.md"),
          },
        },
      })
    end,
    keys = {
      -- Launch panel if nothing is typed after <leader>z
      { "<leader>z", "<cmd>Telekasten panel<CR>" },

      -- Most used functions
      { "<leader>zf", "<cmd>Telekasten find_notes<CR>" },
      { "<leader>zd", "<cmd>Telekasten find_daily_notes<CR>" },
      { "<leader>zg", "<cmd>Telekasten search_notes<CR>" },
      { "<leader>zz", "<cmd>Telekasten follow_link<CR>" },
      { "<leader>zT", "<cmd>Telekasten goto_today<CR>" },
      { "<leader>zn", "<cmd>Telekasten new_note<CR>" },
      { "<leader>zN", "<cmd>Telekasten new_templated_note<CR>" },
      { "<leader>zI", "<cmd>Telekasten insert_img_link<CR>" },
      { "<leader>zy", "<cmd>Telekasten yank_notelink<CR>" },
      { "<leader>zc", "<cmd>Telekasten show_calendar<CR>" },
      { "<leader>zC", "<cmd>CalendarT<CR>" },
      { "<leader>zi", "<cmd>Telekasten paste_ig_and_link<CR>" },
      { "<leader>zt", "<cmd>Telekasten toggle_todo<CR>" },
      { "<leader>zb", "<cmd>Telekasten show_backlinks<CR>" },
      { "<leader>zF", "<cmd>Telekasten find_frends<CR>" },
      { "<leader>zI", "<cmd>Telekasten insert_img_link<CR>" },
      { "<leader>zp", "<cmd>Telekasten preview_img<CR>" },
      { "<leader>zm", "<cmd>Telekasten browse_media<CR>" },
      { "<leader>z#", "<cmd>Telekasten show_tags<CR>" },
      { "<leader>zs", "<cmd>Telekasten switch_vault<CR>" },

      -- Call insert link automatically when we start typing a link
      {
        mode = "i",
        "[[",
        "<cmd>Telekasten insert_link<CR>",
        desc = "Call insert link automatically when we start typing a link",
      },
    },
  },
}
