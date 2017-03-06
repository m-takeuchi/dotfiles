#!/bin/bash

DOTPATH=~/dotfiles

cd ${DOTPATH}

for f in .??*
do
	[[ ${f} = ".git" ]] && continue
	[[ ${f} = ".gitignore" ]] && continue
	ln -sniv ${DOTPATH}/${f} ${HOME}/${f}
done
echo 'Deploy dotfiles complete!'
