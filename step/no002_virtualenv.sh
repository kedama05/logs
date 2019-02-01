#!/bin/bash
WORK_DIR=${PWD}
# install virtualenv
sudo pip3 install virtualenv

# make workspace dir
mkdir ~/workspace/tensorflow-gpu -p && cd ~/workspace/tensorflow-gpu

# make virtual env
virtualenv env_tensorflow-gpu -p python3.5 --system-site-package
. env_tensorflow-gpu/bin/activate
pip install tensorflow-gpu==1.2.0 keras
pip list
deactivate

while true; do
  read -p 'Do you remove workspace? [Y/n]' Answer
  case $Answer in
    '' | [Yy]* )
      rm ~/workspace -rf
      echo remove!
      break;
      ;;
    [Nn]* )
      echo leave!
      break;
      ;;
    * )
      echo Please answer YES or NO.
  esac
done;

cd $WORK_DIR
