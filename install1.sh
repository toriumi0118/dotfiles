#!/bin/bash
brew update
brew install --cask hyper
brew install --cask raycast

# hyper
hyper i hyper-material-theme
hyper i hyperminimal

brew install \
        fish \
        reattach-to-user-namespace \
        gh \
        ghq





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

# 一番最初にこれやって切り替えた後に実行するやつがあってもいいかもね。
echo ''
echo '>>>>>>> SWITCH default shell'
echo '>>>>>>>>> ADD `/usr/local/bin/fish` to /etc/shells'
echo 'vim /etc/shells'
echo '>>>>>>>>> CHANGE DEFAULT SHELL'
echo 'chsh -s /usr/local/bin/fish'

echo ''
echo '>>>>> FINISH install1.sh'
