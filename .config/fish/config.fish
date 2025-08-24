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

set --export ANTHROPIC_API_KEY $(security find-generic-password -s "ANTHROPIC_API_KEY" -w)
