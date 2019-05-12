#!/bin/bash
WORK_DIR=${PWD}

# edit .vimrc
echo "$(cat $WORK_DIR/._bashrc)" >> ~/.bashrc

source ~/.bashrc

echo "finish"

cd $WORK_DIR
