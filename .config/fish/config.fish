if status is-interactive
    # Commands to run in interactive sessions can go here
    . ~/.config/fish/aliases.fish
    alias vim='nvim'
    alias tmux='tmux -u'

    # Default Environments
    set --export EDITOR nvim

    fish_add_path /opt/homebrew/bin
    set --export PATH /Users/toriumi0118/.bin $PATH # terrafrom-lsp

    # Set PATH, MANPATH, etc., for Homebrew.
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # flutter script
    set --export PATH $PATH $HOME/.pub-cache/bin # flutter
end

zoxide init fish | source

set _asdf_shims "$HOME/.asdf/shims"
set -gx --prepend PATH $_asdf_shims
set --erase _asdf_shims

set --export ANTHROPIC_API_KEY $(security find-generic-password -s "ANTHROPIC_API_KEY" -w)
~/.local/bin/mise activate fish | source

# pnpm
set -gx PNPM_HOME /Users/toriumi0118/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# wtp 
wtp shell-init fish | source

# direnv
direnv hook fish | source

source ~/.safe-chain/scripts/init-fish.fish # Safe-chain Fish initialization script
