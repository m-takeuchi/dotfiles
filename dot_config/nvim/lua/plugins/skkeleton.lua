return {
  -- add symbols-outline
  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc.vim",
      "Shougo/ddc-ui-native",
    },
    config = function()
      vim.cmd([[ call skkeleton#config({
      \ 'completionRankFile': '~/.skk/rank.json',
      \ 'eggLikeNewline':v:true,
      \'sources':["skk_dictionary"],
      \ 'globalDictionaries': [
          \'~/.skk/SKK-JISYO.L',
          \'~/.skk/SKK-JISYO.jinmei',
          \'~/.skk/SKK-JISYO.edict',
          \'~/.skk/SKK-JISYO.geo',
          \'~/.skk/SKK-JISYO.propernoun'],     
      \ })]])
      vim.cmd([[ call ddc#custom#patch_global( 'sources', ['skkeleton'])]])
      vim.cmd([[ call ddc#custom#patch_global( 'sourceOptions', {
        \ '_': {
        \ 'matchers': ['matcher_head'],
        \ 'sorters': ['sorter_rank'],
        \ },
        \ 'skkeleton' : {
        \ 'mark': 'skkeleton',
        \ 'matchers': [],
        \ 'sorters': [],
        \ 'converters': [],
        \ 'isVolatile': v:true,
        \ 'minAutoCompleteLength': 1
        \ }})]])
      vim.cmd([[call ddc#enable()]])
      vim.cmd([[call ddc#custom#patch_global('ui', 'pum')]])
    end,
  },
}
