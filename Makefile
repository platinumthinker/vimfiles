all: bundle/vundle undodir
	vim +BundleInstall +qa

bundle/vundle:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

undodir:
	mkdir undodir
