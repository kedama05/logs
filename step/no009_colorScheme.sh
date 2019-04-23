#!/bin/bash
# get work_dir
WORK_DIR=${PWD}

# dein.vim
# edit .vimrc
echo "$(cat $WORK_DIR/.colorSchemeVimrc)" >> ~/.vimrc

# add .vimrc by yourself
echo "WORK 1."
echo "insert "color shcheme" pulgin. -> ~/.vimrc"
echo "call dein#add('raphamorim/lucario')"

# next work.
echo "WORK 2."
echo "Open vim and Install dein."
echo "[run]  :call dein#install() ."
echo "[run]  sh no009_indentGuides.sh"
