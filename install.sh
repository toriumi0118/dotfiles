#!/bin/bash

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fisher install jethrokuan/z jethrokuan/fzf oh-my-fish/plugin-balias
/opt/homebrew/opt/fzf/install

brew update
brew install --cask iterm2
brew install --cask alfred
brew install --cask docker
# brew install --cask skitch
brew install --cask tableplus
brew install --cask google-cloud-sdk
brew install --cask licecap
brew install --cask slack

# terraform + terragrunt
brew install tfenv
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install terragrunt
brew install java

# tmux(package manager: tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew install \
        fish \
        gh \
        ghq \
        tmux \
        nvim \
	peco \
	tree \
	icu4c \
	ripgrep \
	fd \
	fzf \
	asdf \
        coreutils \
        automake \
        autoconf \
        openssl \
        libyaml \
        readline \
        libxslt \
        libtool \
        libpq \
        unixodbc \
        curl \
        gawk \
        gpg \
        cmake \
        hashicorp/tap/terraform-ls \
        fastlane \
        sccache \
        bat

brew link --force libpq

# rust
brew install rust-analyzer

# nvim
python3 -m pip install --user --upgrade pynvim
asdf plugin add nodejs
asdf install nodejs lts
asdf global nodejs lts

# font
brew install --cask font-plemol-jp
brew install --cask font-plemol-jp-nf
brew install --cask font-plemol-jp-hs
echo '*** ダウンロードに失敗しているかもしれないので、https://github.com/yuru7/PlemolJP check!! ***'

echo 'Install tpm plugin type: "[Ctrl-j] + I"'
echo 'tmux with iterm2 might work with ctrl + j to switch clients, then you should turn on `Report modifier using CSI u` in iterm2 preference'
echo 'ref: https://github.com/tmux/tmux/wiki/Modifier-Keys'
