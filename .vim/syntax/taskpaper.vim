" Vim syntax file
" Language:	Taskpaper (http://hogbaysoftware.com/projects/taskpaper)
" Maintainer:	David O'Callaghan <david.ocallaghan@cs.tcd.ie>
" URL:		http://www.cs.tcd.ie/David.OCallaghan/taskpaper.vim/
" Version:	1
" Last Change:  2007 Sep 25

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

" some style definitions
hi def tpProject term=bold,underline cterm=bold,underline gui=bold,underline ctermbg=DarkYellow guibg=LightGray 
hi def tpDoneTask ctermfg=DarkCyan guifg=Gray
"add by Takeuchi
hi def tpNowTask ctermfg=Red guifg=Yellow
hi def tpPendingTask ctermfg=DarkMagenta guifg=Gray

syn case ignore

syn match  taskpaperProject       /^.\+:\s*$/
syn match  taskpaperLineContinue ".$" contained
syn match  taskpaperListItem  "^\s*[-+]\s\+" 
syn match  taskpaperContext  "@[A-Za-z0-9_]\+"
syn match  taskpaperDone "^\s*[-+]\s\+.*@[Dd]one.*$"
"add by Takeuchi
syn match  taskpaperNow "^\s*[-+]\s\+.*@[Nn]ow.*$"
syn match  taskpaperPending "^\s*[-+]\s\+.*@[Pp]ending.*$"

syn region taskpaperProjectFold start=/^.\+:\s*$/ end=/^\s*$/ transparent fold

syn sync fromstart

"highlighting for Taskpaper groups
HiLink taskpaperListItem       Identifier
HiLink taskpaperContext       Identifier
HiLink taskpaperProject       tpProject
HiLink taskpaperDone          tpDoneTask
"add by Takeuchi
HiLink taskpaperNow          tpNowTask
HiLink taskpaperPending          tpPendingTask

let b:current_syntax = "taskpaper"

delcommand HiLink
" vim: ts=8
