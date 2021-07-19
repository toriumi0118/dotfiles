balias g   'git'
balias gst 'git status'
balias gd  'git diff'
balias gdd 'git branch --merged|egrep -v "\^\\* |develop\$|master\$"|xargs git branch -d'
balias gdc 'git diff --cached'
balias gp  'git push'

function gdv
  git diff -w $argv | view -
end

balias gc   'git commit -v'
balias gca  'git commit -v -a'
balias gcam 'git commit -v -a -m'
balias gcm  'git commit -m'
balias gco  'git checkout'
balias gr   'git remote'
balias grv  'git remote -v'
balias gru  'git remote update --prune'
balias grbi 'git rebase -i'
balias grbc 'git rebase --continue'
balias grba 'git rebase --abort'
balias gb   'git branch'
balias glo  'git log --oneline'
balias glog 'git log --oneline --graph'
balias gss  'git status -s'
balias ga   'git add'
balias gm   'git merge'
