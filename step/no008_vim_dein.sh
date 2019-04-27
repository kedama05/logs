#!/bin/bash
# get work_dir
WORK_DIR=${PWD}

echo "Edit .vimrc"
echo "no008-no0011"
# dein.vim
# edit .vimrc
echo "$(cat $WORK_DIR/.deinVimrc)" >> ~/.vimrc

## mkdir for pulgin
mkdir -p ~/.vim/plugin
mkdir -p ~/.vim/bundles
cd ~/.vim/plugin
# install curl
sudo apt install curl

# curl
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles

cd $WORK_DIR

# next work.
echo "Open vim and Install dein."
echo "[run]  :call dein#install()."
echo "[run]  sh no008_colorScheme.sh"
