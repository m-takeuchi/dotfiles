#!/usr/bin/env fish

# ### os specific
# switch (uname)
# case 'freebsd*|darwin*'
#     echo "unix"
# case 'linux*'
# 	echo "linux"
# end


# keybinding


# emacsclient aliases
alias e='emacsclient -nw -a ""'
alias eg='emacsclient -c -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'



# dotfiles path
set -x DOTPATH ~/dotfiles

# path setting for original shell scripts
set -x PATH ~/bin ~/graph_mpl $PATH
# set -x PATH ~/graph_mpl $PATH

# nodebrew
set -x PATH ~/.nodebrew/current/bin $PATH

#For Golang
set -x GOPATH ~/go
set -x PATH $PATH $GOPATH/bin


# brew api token
if [ -f ~/.brew_api_token ]
  set -x HOMEBREW_GITHUB_API_TOKEN (cat ~/.brew_api_token)
end

# conoha api
if [ -f ~/.conoha_api ]
  source ~/.conoha_api_fish
end

#Emacs cask
# set -x PATH ~/.emacs.d/.cask/bin $PATH


# notmuch in emacs: 日本語ワードの検索ため
set -x XAPIAN_CJK_NGRAM 1

# pkg_config
set -x PKG_CONFIG_PATH /usr/local/lib/pkgconfig /opt/X11/lib/pkgconfig

# export EDITOR=emacs
set -x EDITOR "emacs -nw"

# For stow setting
set -x PATH ~/usr/local/bin $PATH

# For pyenv-virtualenv
status --is-interactive; and . (pyenv init -| psub)
set -x PATH $HOME/.pyenv/shims $PATH 

## auto proxy setting relating to wifi
set KUINS_PROXY 'http://proxy.kuins.net:8080'

set WIFI (networksetup -getairportnetwork en0)
if [ (echo $WIFI | grep -cie KUINS-Air -cie kuins -cie rgw) = 1 ]
    set -x http_proxy $KUINS_PROXY
    set -x https_proxy $KUINS_PROXY
    set -x HTTPS_PROXY $KUINS_PROXY
    set -x ftp_proxy $KUINS_PROXY
    set -x FTP_PROXY $KUINS_PROXY
    set -x proxy_rsync $KUINS_PROXY
    set -x rsync_proxy $KUINS_PROXY
    set -x RSYNC_PROXY $KUINS_PROXY
    set -x ALL_PROXY $KUINS_PROXY
else
    set -x http_proxy ""
    set -x https_proxy ""
    set -x HTTPS_PROXY ""
    set -x ftp_proxy ""
    set -x FTP_PROXY ""
    set -x proxy_rsync ""
    set -x rsync_proxy ""
    set -x RSYNC_PROXY ""
    set -x ALL_PROXY ""
end
# echo $WIFI
