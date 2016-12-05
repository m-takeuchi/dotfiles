" -----------------
"  vimrc for janus
" -----------------

" Source other vim command
if has("gui_win32")
	if $TERM == ""
		set shell=$BASHPATH\ --login
	else
		set shell=$BASHPATH
	endif
	set shellslash

	" Add .vim directory to runtimepath
	set runtimepath+=$HOME\.vim

	" Windows setting for Access permissions
	set backupcopy=yes
	set nobackup
endif

" Common options
syntax on
"set incsearch
"set nobk
set number
"set smartcase
"set wildmode=list
set autoindent
set backspace=indent,eol,start
"set encoding=japan
"set grepprg=search\ $*
set hlsearch
set iminsert=0
set imsearch=0
set listchars=eol:$,tab:>-
set nowrap
set ruler
set shiftwidth=4
set shortmess+=I
set showcmd
set visualbell
set scrolloff=2



if has("gui_win32")
	set guifont=ＭＳ_ゴシック:h12:cSHIFTJIS
	set printfont=ＭＳ_ゴシック:h10:cSHIFTJIS
	" autocmd GUIEnter * simalt ~x
	" autocmd GUIEnter * winpos 100 0
	autocmd GUIEnter * winsize 80 52
else
	au BufNewFile,BufRead fstab setf fstab
	if has("gui_running")
		if $LANG == "ja_JP.eucJP"
			inoremap   :set iminsert=0
			if $HOSTNAME == "vaio"
				" set guifontset=-alias-fixed-medium-r-normal-*-*-160-*-*-c-*-jisx0201.1976-0
				set printfont=-alias-fixed-medium-r-normal-*-*-160-*-*-c-*-jisx0201.1976-0
				set guifont=gothic\ Medium\ 14
			else
				set guifontset=-alias-fixed-medium-r-normal-*-*-160-*-*-c-*-jisx0201.1976-0
				set printfont=-alias-fixed-medium-r-normal-*-*-160-*-*-c-*-jisx0201.1976-0
			endif
			set imactivatekey=S-space
		endif
		autocmd GUIEnter * winsize 80 45 
	else
		set mouse=a
	endif
endif
set t_Co=256
"colorscheme leo
"colorscheme inkpot
"colorscheme koehler
"colorscheme desert256
"colorscheme murphy
"colorscheme elflord
"autocmd VimEnter * :GuiColorScheme koehler
"set background=dark
"set background=light

" Key mapping for search
"vnoremap  y/\V=substitute(escape(@",'/'),"\n","\\\\n","g")/
"vnoremap  y?\V=substitute(escape(@",'/'),"\n","\\\\n","g")?
"nnoremap  /
"nnoremap  ?

" for autocmd
if has("autocmd")
	filetype plugin indent on
	autocmd FileType text setlocal textwidth=78
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
	autocmd BufEnter * :cd %:p:h
endif

"-------------------
" for local setting
"-------------------
set encoding=utf-8
set fileencoding=utf-8
set clipboard=unnamed,autoselect


" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'

  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif

  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" UTF-8の□や○でカーソル位置がずれないようにする
if exists("&ambiwidth")
  set ambiwidth=double
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac


set tags+=../tags,../../tags,../../../tags
set number
let format_join_spaces = 2 "format.vim
let format_allow_over_tw = 0 "format.vim
set wrap! "orikaeshi



"--------------------
" latex-suite setting
"--------------------

" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
"set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" pdfを作る手順を指定
let g:Tex_FormatDependency_pdf = 'dvi,pdf'

" TeXコンパイラを指定．
"let g:Tex_CompileRule_dvi = 'nkfplatex.sh'
"let g:Tex_CompileRule_dvi = 'platex  --interaction=nonstopmode $*'
let g:Tex_CompileRule_dvi = '/usr/local/teTeX/bin/platex  --interaction=nonstopmode $*'
"let g:Tex_CompileRule_dvi = 'platex $*'

" pdfプリンタを指定．
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
"let g:Tex_CompileRule_pdf = 'dvipdfmx -p a4 -l $*.dvi' "for 応物予稿集
"let g:Tex_CompileRule_pdf = 'dvipdf $*.dvi'

" dviwareを指定．
let g:Tex_ViewRule_dvi = 'xdvi' 
"let g:Tex_ViewRule_dvi = 'evince' 

" pdfviewerを指定．
"let g:Tex_ViewRule_pdf = 'acroread' 
"let g:Tex_ViewRule_pdf = 'xpdf' 
let g:Tex_ViewRule_pdf = 'evince' 

" bibtexを指定
let g:Tex_BibtexFlavor = 'jbibtex'

" 無視する警告を設定
let g:Tex_IgnoredWarnings =
	\'Underfull'."\n".
	\'Overfull'."\n".
	\'specifier changed to'."\n".
	\'You have requested'."\n".
	\'Missing number, treated as zero.'."\n".
	\'There were undefined references'."\n".
	\'Citation %.%# undefined'."\n".
	\"Font shape \`JT1/gt/m/it\' undefined"."\n".
	\"Font shape \`JY1/gt/m/it\' undefined"."\n".
	\"Font shape \`JT1/mc/m/it\' undefined"."\n".
	\"Font shape \`JY1/mc/m/it\' undefined"."\n".
	\'LaTeX Font Warning: Some font shapes were not available, defaults substituted.'
let g:Tex_IgnoreLevel = 12

"起動キーをskkとかぶらないように変更
"imap <C-k> <Plug>IMAP_JumpForward

"-----------------------
"Chalice configuration
"-----------------------
	"set runtimepath+=$HOME/.vim/curl
	"runtime plugin/curl

	set runtimepath+=$HOME/.vim/chalice
	runtime plugin/chalice	
	"板デフォルトの名無しさんを使用
	let chalice_anonyname = ''
	" -<CR>でFireFox、1-<CR>でw3mを起動。9-<CR>でファイルをダウンロード
	let chalice_exbrowser = 'Firefox %URL% &'
	let chalice_exbrowser_1 = 'kterm -rv -e w3m %URL% &'
	let chalice_exbrowser_9 = 'wget -P ~/download %URL% &'
	let chalice_threadinfo = 1
	" プロクシを使用
	"let chalice_curl_options = '-x proxy.kuins.net:8080'
	let chalice_foldmarks = '●○'
	let chalice_statusline = '%c,'
	" 起動時にスレの栞を表示
	let chalice_startupflags = 'bookmark'
	let chalice_writeoptions = 'amp,nbsp,zenkaku'

"-------------------
" howm_vim settings
"-------------------
"set runtimepath+=$HOME/.vim/howm
"let g:howm_dir = "$HOME/.vim/howm/memo"
"let g:howm_grepprg = "/bin/grep"
"let g:howm_findprg = "/usr/bin/find"

"-------------------
" wildmenu
"-------------------
:source $VIMRUNTIME/menu.vim
:set wildmenu
:set cpo-=<
:set wcm=<C-Z>
:map <F4> :emenu <C-Z>

"
"SKK jisho settings
"
let plugin_skk_disable = 1 "skk.vimの無効化. 有効にしたいときは値を0に.
let skk_jisyo = '~/.skk-jisyo'
let skk_large_jisyo = '/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1
let skk_control_j_key = "<C-j>" "skkの起動キー

"----------------------------------------------
"shell without dissapearing current display
"----------------------------------------------
:nmap gsh :set t_te= t_ti=<cr>:sh<cr>:set t_te& t_ti&<cr>

"----------------------------------------------
"status line settings
"----------------------------------------------

set laststatus=2 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [FENC=%{&fenc}]\ [FF=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"インサートモードを抜けるときに日本語IMを自動オフ --> なぜだかうまくいかない
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"lettuce.vim : highly detalized dark scheme for gui and 256 color terminal 
set fillchars=vert:\ ,fold:\ " <- trailing space


"changelog settings
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Mitsuaki Takeuchi <m2takeuchi@fea>"

"Tab settings for python script
autocmd FileType python setlocal ts=4 sw=4 sta et sts ai

"command-line mode settings
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>
:cnoremap <Esc>b <S-Left>
:cnoremap <Esc>f <S-Right>
:cnoremap <C-D> <Del>

"insert mode settings
inoremap <C-h> <BS>
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>

"set C-h key to delete 1 character before cursor
nnoremap <C-h> X
"カーソルを表示行で移動する。論理行移動は<C-n>,<C-p>
"キーボードマクロには論理行移動を推奨。
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up> gk
