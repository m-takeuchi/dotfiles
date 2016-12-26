#!/bin/bash

DOTPATH=~/dotfiles



# is_exists returns true if executable $1 exists in $PATH
function is_exists() {
	which "$1" >/dev/null 2>&1
	return $?
}


# has is wrapper function
function has() {
	is_exists "$@"
	}


echo "If this is first time on Ubuntu, you should run:"
echo "sudo apt-get install build-essential curl git python-setuptools ruby"
echo "sudo apt-get install m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev gettext"
echo 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"'

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

cd $DOTPATH
if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH"
fi

# 移動できたらリンクを実行する
for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

#tmux plugin
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
