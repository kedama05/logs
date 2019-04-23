#!/bin/bash
# add repository
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:jonathonf/python-3.6
# sumbolic link
cd /usr/lib/python3/dist-packages
sudo ln -s apt_pkg.cpython-{35m,36m}-x86_64-linux-gnu.so

# install python3.6
sudo apt-get update
sudo apt-get install python3.6 python3.6-dev

# change link
sudo ln -nfs /usr/bin/python3.6 /usr/bin/python3
sudo python3 -m pip install --upgrade pip
# check
python3 --version

