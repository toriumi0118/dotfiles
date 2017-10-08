### Aliases
alias vi='/Applications/MacVim.app/Contents/bin/vim'
alias vim='/Applications/MacVim.app/Contents/bin/vim'

### Add Command for peco with z
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
