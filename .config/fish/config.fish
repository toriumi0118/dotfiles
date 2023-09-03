if status is-interactive
    # Commands to run in interactive sessions can go here
    . ~/.config/fish/aliases.fish
    alias vim='nvim'
    alias tmux='tmux -u'

    # Add Command for peco with z
    function peco_z
      set -l query (commandline)
    
      if test -n $query
        set peco_flags --query "$query"
      end
    
      z -l | peco $peco_flags | awk '{ print $2 }' | read recent
      if [ $recent ]
        cd $recent
        commandline -r ''
        commandline -f repaint
        end
    end
    
    # Default Environments
    set --export EDITOR nvim
    set --export PATH $PATH /Users/toriumi0118/.bin # terrafrom-lsp

    # Set PATH, MANPATH, etc., for Homebrew.
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # flutter script
    set --export PATH $PATH $HOME/.pub-cache/bin # flutter
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish
