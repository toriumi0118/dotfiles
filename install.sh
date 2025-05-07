#!/bin/bash

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish oh-my-fish/plugin-balias

# tmux(package manager: tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew update
brew install --cask alfred
brew install --cask docker
# brew install --cask skitch
brew install --cask tableplus
brew install --cask google-cloud-sdk
brew install --cask licecap
brew install --cask slack
brew install --cask ghostty

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

# lazygit
brew install jesseduffield/lazygit/lazygit
brew install lazygit

# nvim
python3 -m pip install --user --upgrade pynvim
asdf plugin add nodejs
asdf install nodejs lts
asdf global nodejs lts
npm install -g neovim

asdf plugin add ruby
asdf install ruby 3.4.2
asdf global ruby 3.4.2
gem install neovim

# rust
# rustup component add rust-analyzer

echo 'Install tpm plugin type: "[Ctrl-j] + I"'
