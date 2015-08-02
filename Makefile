all:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	mkdir undodir
	vim +BundleUpdate
