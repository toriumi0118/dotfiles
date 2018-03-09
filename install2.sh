#!/usr/local/bin/fish
echo '>>>>> START install2.sh'

# install file utils
echo ''
echo '>>>>>>> INSTALL fish utils'
brew install peco
fisher z fzf oh-my-fish/plugin-balias
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.2
echo 'source ~/.asdf/asdf.fish' >> ~/.config/fish/config.fish
mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
brew install coreutils automake autoconf openssl libyaml readline libxslt libtool unixodbc

echo ''
echo '>>>>> FINISH install2.sh'
