return {
  {
    -- ⭐️ 不安定な blink.cmp から、安定したオリジナルの nvim-cmp に変更
    "hrsh7th/nvim-cmp",
    -- 念のため、起動時に読み込み、優先度を最大に設定
    lazy = false,
    priority = 1000,
    dependencies = {
      "uga-rosa/cmp-skkeleton",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    -- 全てを手動で設定し、読み込み順の問題を完全に排除
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- skkeletonのソースを手動で登録
      cmp.register_source("skkeleton", require("cmp_skkeleton.source").new())

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "skkeleton", group_index = 1 },
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
        -- ⭐️ Change the 'window' section to this more explicit version
        window = {
          completion = {
            border = "single", -- 'single', 'double', 'rounded' etc.
          },
          documentation = {
            border = "single",
          },
        },
      })
    end,
  },
}
