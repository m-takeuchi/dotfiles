export MANPATH="/home/bempp/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/bempp/.linuxbrew/share/info:$INFOPATH"
export PATH="/home/bempp/.linuxbrew/bin:$PATH"


if [ "$PS1" ]; then
    if [ -x "$HOME/.linuxbrew/bin/zsh" ]; then
        export SHELL=$HOME/.linuxbrew/bin/zsh
        exec $SHELL -l
    fi
fi
