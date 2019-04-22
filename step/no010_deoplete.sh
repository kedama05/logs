#!/bin/bash
# get work_dir
WORK_DIR=${PWD}

# predict code.

# deoplete.nvim
# edit .vimrc
echo "$(cat $WORK_DIR/.deopleteVimrc)" >> ~/.vimrc

# add .vimrc by yourself
echo "WORK 1."
echo "insert "deoplete.nvim" pulgin. -> ~/.vimrc"
echo "call dein#add('Shougo/deoplete.nvim')"

# next work.
echo "WORK 2."
echo "Open vim."
echo "and Install dein."
echo "run  -> :call dein#install() ."

