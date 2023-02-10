function fish_user_key_bindings
    ### peco_z ###
    bind \c] peco_z # Ctrl-]にバインドする
    bind -M insert \c] peco_z # Ctrl-]にバインドする
    ### peco_z ###
    ### fzf ###
    bind \cf '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \co '__fzf_cd'
    bind \ci '__fzf_cd --hidden'
    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \cf '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \co '__fzf_cd'
        bind -M insert \ci '__fzf_cd --hidden'
    end
    if set -q FZF_COMPLETE
        bind \t '__fzf_complete'
    end
    ### fzf ###

    fish_vi_key_bindings insert
    bind -M insert \ce accept-autosuggestion
end

fzf_key_bindings
