#!/bin/bash

mkdir -p ~/.vim/plugged/
cd ~/.vim/plugged && git clone https://github.com/junegunn/vim-plug.git
vim +PlugInstall
