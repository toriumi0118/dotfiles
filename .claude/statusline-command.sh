#!/bin/bash
input=$(cat)
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
model_name=$(echo "$input" | jq -r '.model.display_name')

# gitルートを起点にディレクトリ表示
git_root=$(git -C "$current_dir" rev-parse --show-toplevel 2>/dev/null)
if [ -n "$git_root" ]; then
    repo_name=$(basename "$git_root")
    # macOS対応: 文字列操作で相対パスを計算
    rel_path="${current_dir#$git_root}"
    rel_path="${rel_path#/}"
    if [ -z "$rel_path" ]; then
        current_dir_display="$repo_name"
    else
        current_dir_display="$repo_name/$rel_path"
    fi
else
    current_dir_display="${current_dir/#$HOME/\~}"
fi

git_info=""
if git -C "$current_dir" rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git -C "$current_dir" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || echo "detached")
    if [ -n "$(git -C "$current_dir" --no-optional-locks status -s --ignore-submodules=dirty 2>/dev/null)" ]; then
        git_status=""
        while IFS= read -r line; do
            case "$line" in
                "M "*|" M") git_status="${git_status}✱" ;;
                "A "*|" A") git_status="${git_status}✚" ;;
                "D "*|" D") git_status="${git_status}✖" ;;
                "??") git_status="${git_status}≠" ;;
            esac
        done < <(git -C "$current_dir" --no-optional-locks status -s 2>/dev/null | cut -c1-2 | sort -u)
        git_info=$(printf "\033[91m%s\033[0m \033[34m%s\033[0m" "$git_status" "$branch")
    else
        git_info=$(printf "\033[32m:\033[0m \033[34m%s\033[0m" "$branch")
    fi
    git_info="(git $git_info)"
fi

printf "\033[93m%s\033[0m" "$current_dir_display"
[ -n "$git_info" ] && printf " %s" "$git_info"
printf " \033[2m%s\033[0m" "$model_name"
