function theme --description "Print OS theme: dark|light"
    # --- macOS ---
    if type -q defaults
        # defaults exits non-zero when key doesn't exist (Light mode), so silence errors
        if defaults read -g AppleInterfaceStyle 2>/dev/null | string match -qi "*dark*"
            echo dark
        else
            echo light
        end
        return 0
    end
    # --- default to light ---
    echo light
    return 0
end
