return {
  "vim-skk/skkeleton",
  dependencies = { "vim-denops/denops.vim" },
  config = function()
    -- 1. Configure core IME settings
    vim.cmd([[ call skkeleton#config({
    \ 'eggLikeNewline': v:true,
    \ 'completionRankFile': '~/.skk/rank.json',
    \ 'sources': ['skk_dictionary'],
    \ 'globalDictionaries': [
    \   '~/.skk/SKK-JISYO.L',
    \   '~/.skk/SKK-JISYO.jinmei',
    \   '~/.skk/SKK-JISYO.edict',
    \   '~/.skk/SKK-JISYO.geo',
    \   '~/.skk/SKK-JISYO.propernoun'
    \ ]
    \ })]])

    -- 2. ⭐️ Configure all popup menu options via global variables
    vim.g["skkeleton#usePopupMenu"] = true -- Explicitly enable the popup
    vim.g["skkeleton#popup_menu_zindex"] = 3000 -- Fix window overlap
    vim.g["skkeleton#popup_menu_border"] = "single" -- Set the border style
  end,
}
