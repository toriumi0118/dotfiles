#!/usr/local/bin/fish
echo '>>>>> START install2.sh'

# install file utils
echo ''
echo '>>>>>>> INSTALL fish utils'
brew install peco ghq tree neovim
fisher install jethrokuan/z jethrokuan/fzf oh-my-fish/plugin-balias
git clone https://github.com/asdf-vm/asdf.git ~/.asdf 
echo 'source ~/.asdf/asdf.fish' >> ~/.config/fish/config.fish
mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc gpg

echo '>>>>>>> INSTALL vim utils'
brew install the_silver_searcher

echo '>>>>>>> INSTALL latest node'
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

echo ''
echo '>>>>> FINISH install2.sh'
