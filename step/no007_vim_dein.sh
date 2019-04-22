#!/bin/bash

# dein.vim
## mkdir for pulgin
cat dein_vimrc.txt >> ~/.vimrc
mkdir -p ~/.vim/pulgin
mkdir -p ~/.vim/bundles
cd ~/.vim/pulgin
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundles

echo "Open vim."
echo "and Install dein."
echo "run ":call dein#install()"."
