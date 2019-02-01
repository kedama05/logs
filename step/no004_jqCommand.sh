#!/bin/bash
WORK_DIR=${PWD}

# edit .vimrc
echo "$(cat vimrcJq.txt)" >> ~/.vimrc

#install
sudo apt update
sudo apt install jq

echo "Jq installed"

cd WORK_DIR
