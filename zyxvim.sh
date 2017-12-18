if [ -e ~/.vimrc ]
then
	echo "backup ~/.vimrc as ~/.vimrcbak"
	mv ~/.vimrc ~/.vimrcbak
fi

echo "copy .vimrc"
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
echo "clone Vundle and YouCompleteMe"
git clone https://github.com/VundleVim/Vundle.vim.git
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
echo "install cmake if neccessary"
sudo apt-get install build-essential cmake
echo "install python if neccessary"
sudo apt-get install python-dev python3-dev
git submodule update --init --recursive
./install.py --clang-completer
echo "vim PluginInstall..."
vim +PluginInstall +qall
echo "install ctags"
sudo apt-get install exuberant-ctags
echo "install astyle"
sudo apt-get install astyle
echo "install silversearcher"
sudo apt-get install silversearcher-ag
