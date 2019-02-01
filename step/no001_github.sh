#!/bin/bash
echo -n Input Github name:
read name
echo -n Input Github email:
read email

mkdir -p warehouse/git
cd warehouse/git/
# clone logs
git clone https://github.com/kedama05/logs.git
cd logs
git config user.name $name
git config user.email $email
cd ..

# clone init
git clone https://github.com/kedama05/init.git
cd init
git config user.name $name
git config user.email $email
cd ..
