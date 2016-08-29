#!/usr/bin/env zsh

#echo "Load .zshrc"

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"
zplug "k4rthik/git-cal", as:command
case "${OSTYPE}" in
    freebsd*|darwin*)
	#[ -f ~/.zsh/.zshrc.mac ] && source ~/.zsh/.zshrc.mac
	zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*"
	;;
    linux*)
	#[ -f ~/.zsh/.zshrc.linux ] && source ~/.zsh/.zshrc.linux
	zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
	;;
esac

zplug "plugins/git",   from:oh-my-zsh
zplug "jhawthorn/fzy", as:command, rename-to:fzy, \
    hook-build:"
    {
        make
        sudo make install
    } &>/dev/null
    "


zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "b4b4r07/emoji-cli", on:"stedolan/jq"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "b4b4r07/enhancd"
zplug "b4b4r07/zsh-gomi", if:"which fzf"
zplug "mollifier/anyframe"
zstyle ":anyframe:selector:" use fzf


# Looks
zplug "plugins/colorize", from:oh-my-zsh # Colorized cat with pygment

### Prompt
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# Can manage local plugins
# zplug "~/.zsh/.zshrc.mac", from:local, if:"[[ $OSTYPE == *darwin* ]]"
# zplug "~/.zsh/.zshrc.linux", from:local, if:"[[ $OSTYPE == *linux* ]]"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Auto run tmux
if [ -z $TMUX ]; then
  # tmuxのオプションに-2を付けないとubuntuのtmux上でvimがカラーにならない
  tmux -2
fi

## load user .zshrc configuration file
[ -f ~/.zsh/.zshrc.common ] && source ~/.zsh/.zshrc.common
case "${OSTYPE}" in
    freebsd*|darwin*)
	[ -f ~/.zsh/.zshrc.mac ] && source ~/.zsh/.zshrc.mac
	;;
    linux*)
	[ -f ~/.zsh/.zshrc.linux ] && source ~/.zsh/.zshrc.linux
	;;
esac


# Then, source plugins and add commands to $PATH
zplug load --verbose
