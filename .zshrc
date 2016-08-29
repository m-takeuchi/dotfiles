#!/usr/bin/env zsh

#echo "Load .zshrc"

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

### os specific
case "${OSTYPE}" in
    freebsd*|darwin*)
    zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*"
    # echo "hey"
    ;;
    linux*)
    zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
    ;;
esac
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux ### fzf for tmux

### common
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"
zplug "k4rthik/git-cal", as:command

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

zplug "b4b4r07/enhancd", use:init.sh
ENHANCD_FILTER=fzf

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "b4b4r07/zsh-gomi", on:"junegunn/fzf-bin", nice:5
zplug "mollifier/anyframe", on:"junegunn/fzf-bin", nice:5
zstyle ":anyframe:selector:" use fzf
zplug "arks22/tmuximum", as:command, on:"junegunn/fzf-bin"

### Looks
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
# if [ -z $TUX ]; then
#   # tmuxのオプションに-2を付けないとubuntuのtmux上でvimがカラーにならない
#   tmux -2
# fi


## load user .zshrc configuration file
[ -f ~/.zsh/10.zshrc.common ] && source ~/.zsh/10.zshrc.common
case "${OSTYPE}" in
    freebsd*|darwin*)
	[ -f ~/.zsh/20.zshrc.mac ] && source ~/.zsh/20.zshrc.mac
	;;
    linux*)
	[ -f ~/20.zsh/.zshrc.linux ] && source ~/.zsh/20.zshrc.linux
	;;
esac
[ -f ~/.zsh/30.zshrc.common ] && source ~/.zsh/30.zshrc.common

# Then, source plugins and add commands to $PATH
zplug load --verbose
