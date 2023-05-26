#!/bin/bash
brew update
brew install --cask iterm2
brew install --cask raycast
brew install --cask docker
brew install --cask skitch
brew install --cask tableplus
brew install --cask google-cloud-sdk
brew install --cask licecap

# terraform + terragrunt
brew install tfenv
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install terragrunt

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
        sccache

brew link --force libpq

# fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fisher install jethrokuan/z jethrokuan/fzf oh-my-fish/plugin-balias
/opt/homebrew/opt/fzf/install

# nvim
python3 -m pip install --user --upgrade pynvim
asdf plugin add nodejs
asdf install nodejs lts
asdf global nodejs lts

echo 'Download and use Cica fonts: it includes nerdfonts etc. https://github.com/miiton/Cica'
echo 'Install tpm plugin type: "[Ctrl-j] + I"'
