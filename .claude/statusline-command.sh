#!/bin/bash
input=$(cat)
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
model_name=$(echo "$input" | jq -r '.model.display_name')

# Dir display and git branch
git_info=""
if git -C "$current_dir" rev-parse --git-dir >/dev/null 2>&1; then
    dir_display=$(basename "$(git -C "$current_dir" --no-optional-locks rev-parse --show-toplevel 2>/dev/null)")
    branch=$(git -C "$current_dir" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || echo "detached")
    dirty=$(git -C "$current_dir" --no-optional-locks status -s --ignore-submodules=dirty 2>/dev/null)
    if [ -n "$dirty" ]; then
        git_info=" $(printf '\033[33m%s\033[0m' "$branch")*"
    else
        git_info=" $(printf '\033[33m%s\033[0m' "$branch")"
    fi
else
    dir_display=$(basename "$current_dir")
fi

# Context usage
context_part=""
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used" ]; then
    used_int=${used%.*}
    context_part=" | ctx ${used_int}%"
fi

# Output: dir git | model | ctx
printf '\033[33m%s\033[0m' "$dir_display"
printf '%s' "$git_info"
printf ' \033[2m|\033[0m \033[2m%s\033[0m' "$model_name"
printf '\033[2m%s\033[0m' "$context_part"
