#!/bin/bash

DOTPATH=~/dotfiles

## Defining User functions ================================================
## "is_exists" returns true if executable $1 exists in $PATH
function is_exists() {
	which "$1" >/dev/null 2>&1
	return $?
        }


## "has" is wrapper function
function has() {
	is_exists "$@"
        }

## For macos
function inst_homebrew(){
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

## For ubuntu
function inst_linuxbrew(){
    sudo apt-get install build-essential curl git python-setuptools m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev gettext
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
}

## Download dotfiles
function fetch_dotfiles(){
    # git が使えるなら git
    if has "git"; then
	git clone --recursive "$GITHUB_URL" "$DOTPATH"

	# 使えない場合は curl か wget を使用する
    elif has "curl" || has "wget"; then
	tarball="https://github.com/m-takeuchi/dotfiles/archive/master.tar.gz"

	# どっちかでダウンロードして，tar に流す
	if has "curl"; then
	    curl -L "$tarball"

	elif has "wget"; then
	    wget -O - "$tarball"

	fi | tar xv -

	# 解凍したら，DOTPATH に置く
	mv -f dotfiles-master "$DOTPATH"

    else
	echo "curl or wget required"
    fi
}

## Symlink dotfiles
function ln_dotfiles(){
    #### dotfileディレクトリに移動
    cd $DOTPATH
    if [ $? -ne 0 ]; then
	echo "not found: $DOTPATH"
    fi

    #### 移動できたらリンクを実行する
    for f in .??*
    do
	[ "$f" = ".git" ] && continue
	[ "$f" = ".gitignore" ] && continue
  
	ln -sniv "$DOTPATH/$f" "$HOME/$f"
    done
}
##===========================================================================


### Check OS
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
# elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
#   OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi


#### DOTPATHの存在確認とダウンロード&symlink
if [ $DOTPATH ] ; then
    echo "$DOTPATH is already exists. Excute git pull instead."
else
    echo "Download dotfiles to $DOTPATH"
    fetch_dotfiles
    ln_dotfiles
fi




### Install homebrew or linuxbrew
case "$OS" in
    "Mac" )
	if has "brew"; then
	    echo "Homebrew alredy exists."
	else
	    echo "Installing Homebrew..."
	    inst_homebrew
	fi
    ;;
    "Linux" )
	if has "brew"; then
	    echo "Linuxbrew alredy exists."
	else
	    echo "Installing Linuxbrew..."
	    inst_linuxbrew
	fi
    ;;
esac

