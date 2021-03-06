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
if [ -d ~/dotfiles ]
  set -x DOTPATH ~/dotfiles
end

# path setting for original shell scripts
if [ -d ~/bin ]
  set -x PATH ~/bin $PATH
end  
if [ -d ~/graph_mpl ]
  set -x PATH ~/graph_mpl $PATH
end
# set -x PATH ~/graph_mpl $PATH

# nodebrew
if [ -d ~/.nodebrew ]
  set -x PATH ~/.nodebrew/current/bin $PATH
end

#For Golang
if [ -d ~/go ]
  set -x GOPATH ~/go
  set -x PATH $PATH $GOPATH/bin
end


# brew api token
if [ -f ~/.brew_api_token ]
  set -x HOMEBREW_GITHUB_API_TOKEN (cat ~/.brew_api_token)
end

# # conoha api
# if [ -f ~/.conoha_api ]
#   source ~/.conoha_api_fish
# end

### LaTeX
## os specific
switch (uname)
case 'freebsd*|Darwin*'
  if [ -d /Library/TeX/texbin ]
    set -x PATH /Library/TeX/texbin $PATH # MacTeX 2017
  end
case 'linux*'
	echo "linux"
end


# notmuch in emacs: 日本語ワードの検索ため
set -x XAPIAN_CJK_NGRAM 1

# pkg_config
set -x PKG_CONFIG_PATH /usr/local/opt/poppler/lib/pkgconfig /usr/local/opt/zlib/lib/pkgconfig /usr/local/lib/pkgconfig /opt/X11/lib/pkgconfig 

# export EDITOR=emacs
#set -x EDITOR "emacs -nw"
set -x EDITOR "vim"

# For stow setting
#set -x PATH ~/usr/local/bin $PATH

# For sleepwatcher
# set -x PATH /usr/local/sbin $PATH

# For pip-installed-with-git executables path
#set -x PATH ~/Library/Python/3.5/bin $PATH

# For pyenv-virtualenv
# status --is-interactive; and . (pyenv init - | psub)
#status --is-interactive; and source (pyenv init - | psub)
#set -gx PYENV_ROOT $HOME/.pyenv
# set -x PYENV_VER (pyenv version-name)
# set -x PATH $PATH $PYENV_ROOT/bin
#set -x PATH $PATH $PYENV_ROOT/shims
#set -x PATH $PATH $PYENV_ROOT/versions/$PYENV_VER/Python.framework/Versions/Current/bin

# set -x PATH $HOME/.pyenv/shims $PATH
# status --is-interactive; and . (pyenv init -| psub)


# OS-specific settings
switch (uname)
	case Darwin
		# source $HOME/.dotfiles/shell/fish/OS/darwin.fish
		source $HOME/.config/fish/functions/proxy.fish
		proxy_mac
	case Linux
		# source $HOME/.dotfiles/shell/fish/OS/linux.fish
    end

#set -g fish_user_paths /usr/local/opt/gpg-agent/bin $fish_user_paths
set -g fish_user_paths "/usr/local/opt/e2fsprogs/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/e2fsprogs/sbin" $fish_user_paths
