#!/bin/bash
WORK_DIR=${PWD}

# edit .vimrc
echo "$(cat $WORK_DIR/.jqVimrc)" >> ~/.vimrc

#install
sudo apt update
sudo apt install jq

echo "Jq installed"

cd $WORK_DIR
