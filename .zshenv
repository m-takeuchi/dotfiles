#!/usr/bin/env zsh

#echo "Load .zshenv"

#source ~/perl5/perlbrew/etc/bashrc
#export WORKON_HOME=/Users/m-takeuchi/.virtualenvs
#export PIP_RESPECT_VIRTUALENV=true
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
# users generic .zshrc file for zsh(1)



#### system-wide environment settings for zsh(1)
# if [ -x /usr/libexec/path_helper ]; then
#     if [ -z "$TMUX" ]; then
# 	eval `/usr/libexec/path_helper -s`
#     fi
# fi
setopt no_global_rcs

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8


# prediction
# autoload predict-on
# predict-on
# autoload -Uz predict-on
# zle -N predict-on
# zle -N predict-off
# bindkey '...' predict-on
# bindkey '...' predict-off

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

# ignore CTRL+D = logout
setopt IGNORE_EOF

# 履歴ファイルに時刻を記録
setopt extended_history

# 補完候補が複数ある時に、一覧表示
setopt auto_list

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# スペースで始まるコマンド行はヒストリリストから削除
# setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# 重複したヒストリは追加しない
setopt hist_ignore_all_dups

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# 補完時にヒストリを自動的に展開
setopt hist_expand
#
# 履歴をインクリメンタルに追加
setopt inc_append_history

# コマンドラインの引数で longoption の = 以降でも補完
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加
setopt mark_dirs

# Command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# インクリメンタルからの検索
# bindkey -r "^R" #unbind
# bindkey -r "^S" #unbind
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
setopt no_flow_control		# シェルノフローコントロールをやめる


# サスペンドをアンバインド
bindkey -r "^Z"



## Completion configuration
#
autoload -U compinit && compinit
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  alias nautilus='nautilus -n'
  ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias df='df -h'
alias screen='screen -U'
alias rm='rm -v'
alias a2ps='LANG=ja_JP.eucJP a2ps --encoding=euc-jp'
alias javac='javac -encoding UTF8 -J-Dfile.encoding=UTF8'
alias java='java -Dfile.encoding=UTF8'


# Prompt configuration
#
# autoload colors
# colors
# case ${UID} in
# 0)
#     PROMPT="%n@%m%% "
#     RPROMPT="%B%{[31m%}%/#%{[m%}%b "
#     PROMPT2="%n@%m%% "
#     RPROMPT2="%B%{[31m%}%_#%{[m%}%b "
#     SPROMPT="%n@%m%% %r is correct? [n,y,a,e]:%{[m%}%b "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#         PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
#     ;;
# *)
#     PROMPT="%{[32m%}%n@%m%%%{[m%} "
#     RPROMPT="%{[32m%}%/%%%{[m%} "
#     PROMPT2="%n@%m%% "
#     RPROMPT2="%{[32m%}%_%%%{[m%} "
#     SPROMPT="%n@%m%% %r is correct? [n,y,a,e]:%{[m%} "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#         PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
#     ;;
# esac

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;36:so=01;32:ex=01;32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;36;1' 'so=;32;1' 'ex=32;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*|screen-bce*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=01;34:ln=01;36:so=01;32:ex=01;32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;36;1' 'so=;32;1' 'ex=32;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# ## load user .zshrc configuration file
# case "${OSTYPE}" in
# freebsd*|darwin*)
# [ -f ~/.zshenv.mac ] && source ~/.zshenv.mac
# ;;
# linux*)
# # [ -f ~/.zshenv.linux ] && source ~/.zshenv.linux
# ;;
# esac

# Clear PATH duplicates
typeset -U path PATH
typeset -U path PYTHONPATH
