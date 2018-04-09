#!/bin/bash

echo "Install python3-pip"
sudo -k apt install python3-pip
mkdir -p ~/.vim/plugged/
cd ~/.vim/plugged && git clone https://github.com/junegunn/vim-plug.git
vim +PlugInstall
