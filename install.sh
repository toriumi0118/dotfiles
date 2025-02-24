#!/bin/bash

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fisher install jethrokuan/z PatrickF1/fzf.fish oh-my-fish/plugin-balias

# tmux(package manager: tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew update
brew install --cask ghostty
brew install --cask alfred
brew install --cask docker
# brew install --cask skitch
brew install --cask tableplus
brew install --cask google-cloud-sdk
brew install --cask licecap
brew install --cask slack

brew install \
        gh \
        ghq \
        tmux \
        nvim \
	tree \
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
        fastlane \
        sccache \
        bat \
        cocoapods \
	java \
	zoxide

# terraform + terragrunt
# brew install tfenv # please use asdf instead
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install terragrunt
brew install hashicorp/tap/terraform-ls

brew link --force libpq

asdf completion fish > ~/.config/fish/completions/asdf.fish

# rust
brew install rust-analyzer

# nvim
python3 -m pip install --user --upgrade pynvim
asdf plugin add nodejs
asdf install nodejs lts
asdf global nodejs lts
npm install -g neovim

asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest
gem install neovim

# # font
# brew install --cask font-plemol-jp
# brew install --cask font-plemol-jp-nf
# brew install --cask font-plemol-jp-hs
# echo '*** ダウンロードに失敗しているかもしれないので、https://github.com/yuru7/PlemolJP check!! ***'
# ghosttyに任せるのでいらない

echo 'Install tpm plugin type: "[Ctrl-j] + I"'
