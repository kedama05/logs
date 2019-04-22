#!/bin/bash
# get work_dir
WORK_DIR=${PWD}

echo "Edit .vimrc"
echo "no007-no009"
# dein.vim
# edit .vimrc
echo "$(cat $WORK_DIR/.deinVimrc)" >> ~/.vimrc

## mkdir for pulgin
mkdir -p ~/.vim/pulgin
mkdir -p ~/.vim/bundles
cd ~/.vim/pulgin
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles

cd $WORK_DIR

# next work.
echo "Open vim and Install dein."
echo "[run]  :call dein#install()."
echo "[run]  sh no008_colorScheme.sh"
