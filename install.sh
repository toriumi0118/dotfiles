# !/bin/bash

echo >>>>> START install.sh
# install fish
echo >>>>>>> INSTALL fish
brew install fish reattach-to-user-namespace
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# install tmux
echo >>>>>>> INSTALL tmux
brew install tmux

# install file utils
echo >>>>>>> INSTALL other utils
brew install peco
fisher z fzf

# copy setting files
echo >>>>>>> COPY setting files
cp -R .ssh ~/
cp -R .config ~/
cp -R .vim ~/
cp .tmux.conf ~/
cp .vimrc ~/

# install vim plugins
## vim-plug
echo >>>>>>> INSTALL vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo >>>>> FINISH install.sh
