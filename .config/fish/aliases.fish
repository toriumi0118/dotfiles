# git
balias g git
balias gst 'git status'
balias gd 'git diff'
balias gdd 'git branch --merged|egrep -v "\^\\* |develop\$|master\$"|xargs git branch -d'
balias gdg 'git branch -vv | grep ": gone]" | awk \'{print $1}\' | xargs -r git branch -D'
balias gdc 'git diff --cached'
balias gdn 'git diff --name-only'
balias gp 'git push'
balias gpl 'git pull'
balias glf 'git diff --name-only $(git merge-base HEAD main)'

function gdv
    git diff -w $argv | view -
end

balias gc 'git commit -v'
balias gca 'git commit -v -a'
balias gcam 'git commit -v -a -m'
balias gcm 'git commit -m'
balias gco 'git checkout'
balias gr 'git remote'
balias grv 'git remote -v'
balias gru 'git remote update --prune'
balias grbi 'git rebase -i'
balias grbc 'git rebase --continue'
balias grba 'git rebase --abort'
balias gb 'git branch -vv'
balias glo 'git log --oneline'
balias glog 'git log --oneline --graph'
balias gss 'git status -s'
balias ga 'git add'
balias gm 'git merge'
balias ggg 'gru; and gpl; and gdd; and gdg'

# worktree
function gwa # 既存のbranchをworktreeに追加
    set branch $argv[1]
    if test -z "$branch"
        echo "Usage: gwa <branch-name> <dir_name>"
        return 1
    end

    # .gitディレクトリを取得
    set gitdir (git rev-parse --git-dir)
    if test $status -ne 0
        echo "Not a git repository"
        return 1
    end

    # ブランチ名の/以降の末尾を取得
    set dir_name $argv[2]

    # 作成先ディレクトリ
    set worktree_dir "$gitdir/wktrs/$dir_name"

    # ディレクトリ作成（念のため）
    mkdir -p $worktree_dir

    # git worktree add 実行
    git worktree add $branch $worktree_dir
end

function gwb # 新しくブランチを作成してworktreeに追加
    set branch $argv[1]
    if test -z "$branch"
        echo "Usage: gwb <branch-name> <dir_name>"
        return 1
    end

    # .gitディレクトリを取得
    set gitdir (git rev-parse --git-dir)
    if test $status -ne 0
        echo "Not a git repository"
        return 1
    end

    # ブランチ名の/以降の末尾を取得
    set dir_name $argv[2]

    # 作成先ディレクトリ
    set worktree_dir "$gitdir/wktrs/$dir_name"

    # ディレクトリ作成（念のため）
    mkdir -p $worktree_dir

    # git worktree add 実行
    git worktree add -b $branch $worktree_dir
end

function gwcd # worktreeのディレクトリに移動
    set dir_name $argv[1]

    # 対応する worktree path
    set gitdir (git rev-parse --git-dir)
    cd "$gitdir/wktrs/$dir_name"
end

balias gwl 'git worktree list'
balias gwr 'git worktree remove'

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
    alias | grep docker | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort
end

# Bash into running container
function dbash
    docker exec -it (docker ps -qf "name=$1") bash
end
