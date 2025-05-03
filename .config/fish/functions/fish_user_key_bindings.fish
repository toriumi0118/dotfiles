function fish_user_key_bindings
    fish_vi_key_bindings insert
    bind -M insert \ce accept-autosuggestion

    bind -M insert \c] 'zi'
    bind -M normal \c] "zi"
    bind -M default \c] 'zi'

    fzf_configure_bindings \
      --directory=\cf \
      --git_log=\cl \
      --git_status=\cs \
      --history=\cr \
      --processes=\cp \
      --variables=\cv
end
