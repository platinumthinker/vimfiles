#!/bin/bash
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mkdir -p ~/.vim/undodir
vim +BundleUpdate
