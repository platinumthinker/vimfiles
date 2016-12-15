#!/bin/bash
mkdir -p ./plugged/
cd ./plugged && git clone https://github.com/junegunn/vim-plug.git
vim +PlugInstall
