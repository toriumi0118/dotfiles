# git
balias g   'git'
balias gst 'git status'
balias gd  'git diff'
balias gdd 'git branch --merged|egrep -v "\^\\* |develop\$|master\$"|xargs git branch -d'
balias gdc 'git diff --cached'
balias gdn 'git diff --name-only'
balias gp  'git push'
balias gpl 'git pull'

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
balias gb   'git branch -vv'
balias glo  'git log --oneline'
balias glog 'git log --oneline --graph'
balias gss  'git status -s'
balias ga   'git add'
balias gm   'git merge'
balias ggg  'gru; and gpl; and gdd'

# docker
# Get latest container ID
balias dl "docker ps -l -q"
# Get container process
balias dps "docker ps"
# Get process included stop container
balias dpa "docker ps -a"
# Get images
balias di "docker images"
# Get container IP
balias dip "docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
# Run deamonized container, e.g., $dkd base /bin/echo hello
balias dkd "docker run -d -P"
# Run interactive container, e.g., $dki base /bin/bash
balias dki "docker run -i -t -P"
# Execute interactive container, e.g., $dex base /bin/bash
balias dex "docker exec -i -t"

# Stop all containers
function dstop
  docker stop (docker ps -a -q)
end

# Remove all containers
function drm
  docker rm (docker ps -a -q)
end

# Stop and Remove all containers
balias drmf 'docker stop (docker ps -a -q) ; docker rm (docker ps -a -q)'

# Remove all images
function dri
  docker rmi (docker images -q)
end

# Dockerfile build, e.g., $dbu tcnksm/test 
function dbu
  docker build -t=$1 .
end

# Show all alias related docker
function dalias
  alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort
end

# Bash into running container
function dbash
  docker exec -it (docker ps -qf "name=$1") bash
end
