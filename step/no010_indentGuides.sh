#!/bin/bash
# get work_dir
WORK_DIR=${PWD}

# dein.vim
# edit .vimrc
echo "$(cat $WORK_DIR/.indentGuidesVimrc)" >> ~/.vimrc

# add .vimrc by yourself
echo "WORK 1."
echo "insert "vim-indent-guides" pulgin. -> ~/.vimrc"
echo "call dein#add('nathanaelkane/vim-indent-guides')"

# next work.
echo "WORK 2."
echo "Open vim."
echo "and Install dein."
echo "run  -> :call dein#install() ."

