#!/bin/bash

echo "[a] vim 8."
echo "[b] neovim."
while true; do
  read -p 'Which vim do you want? [a/b]' Answer
  case $Answer in
    '' | [aA]* )
        sudo add-apt-repository ppa:jonathonf/vim
        sudo apt-get update
        sudo apt-get install vim
        sudo apt-get install vim-gnome
        echo vim8 installed!
        break;
        ;;
    [bB]* )
        sudo add-apt-repository ppa:neovim-ppa/unstable
        sudo apt-get update
        sudo apt-get install neovim
        
        sudo sh -c "echo 'export XDG_CONFIG_HOME=~/.config' >> /etc/profile"
        mkdir -p ~/.config
        ln -s ~/.vim ~/.config/nvim
        ln -s ~/.vimrc ~/.config/nvim/init.vim
        echo neovim installed
        break;
        ;;
        * )
        echo Please answer YES or NO.
    esac
done;
