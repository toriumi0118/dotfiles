#!/usr/local/bin/fish
echo '>>>>> START install2.sh'

# install file utils
echo ''
echo '>>>>>>> INSTALL fish utils'
brew install peco ghq tree icu4c python3 ripgrep fd fzf
/usr/local/opt/fzf/install
brew install --HEAD neovim
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fisher install jethrokuan/z jethrokuan/fzf oh-my-fish/plugin-balias
git clone https://github.com/asdf-vm/asdf.git ~/.asdf 
echo 'source ~/.asdf/asdf.fish' >> ~/.config/fish/config.fish
mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc gpg

echo '>>>>>>> INSTALL nvim utils'
brew install the_silver_searcher
pip3 install -U neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/nvim/dein
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

echo '>>>>>>> INSTALL latest node'
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

echo ''
echo '>>>>> FINISH install2.sh'

