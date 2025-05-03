#!/bin/bash

# fish config
cp -r ./.config/fish/config.fish ~/.config/fish/config.fish
cp ./.config/fish/functions/* ~/.config/fish/functions/

# nvim config
rm -rf ~/.config/nvim
rsync -av --exclude=".DS_Store" ./.config/nvim/ ~/.config/nvim/
