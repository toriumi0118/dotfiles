#!/bin/bash
echo '>>>>> START install1.sh'

# install fish
echo ''
echo '>>>>>>> INSTALL fish'
brew install fish reattach-to-user-namespace direnv
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# install tmux
echo ''
echo '>>>>>>> INSTALL tmux'
brew install tmux

# copy setting files
echo ''
echo '>>>>>>> COPY setting files'
cp -R .ssh ~/
cp -R .config ~/
cp -R .vim ~/
cp .tmux.conf ~/
cp .vimrc ~/

# install vim plugins
echo ''
echo '>>>>>>> INSTALL vim-plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo '>>>>>>> SWITCH default shell'
echo '>>>>>>>>> ADD `/usr/local/bin/fish` to /etc/shells'
echo 'vim /etc/shells'
echo '>>>>>>>>> CHANGE DEFAULT SHELL'
echo 'chsh -s /usr/local/bin/fish'

echo ''
echo '>>>>> FINISH install1.sh'
