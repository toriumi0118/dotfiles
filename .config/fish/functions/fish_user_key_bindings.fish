function fish_user_key_bindings
    fish_vi_key_bindings insert
    bind -M insert \ce accept-autosuggestion
    bind -M insert \c] 'zi'
    bind -M default \c] 'zi'
end
