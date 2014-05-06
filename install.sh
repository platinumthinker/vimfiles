#!/bin/bash
git clone git@github.com:gmarik/vundle.git ~/.vim/bundle/vundle
mkdir -p ~/.vim/undodir
vim +BundleUpdate
