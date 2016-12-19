#!/bin/bash

echo "Install python3-dev node npm build-essential cmake"
sudo -k apt install python3-dev node npm build-essential cmake
mkdir -p ~/.vim/plugged/
cd ~/.vim/plugged && git clone https://github.com/junegunn/vim-plug.git
vim +PlugInstall
