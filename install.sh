ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim/ ~/

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c "PlugInstall" -c "q" -c "q"

npm install -g yarn
cd ~/.vim/plugged/coc.nvim/
yarn install
yarn build
