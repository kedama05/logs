#!/bin/bash
WORK_DIR=${PWD}
vim --version | grep clipboard

# install vim-gnome
while true; do
  read -p 'Is your clipboard available? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      sudo apt install vim-gnome
      echo vim-gnome installed!
      break;
      ;;
    [Nn]* )
      echo pass.
      break;
      ;;
    * )
      echo Please answer YES or NO.
  esac
done;

echo "set clipboard=unnamedplus" >> ~/.vimrc

cd $WORK_DIR
