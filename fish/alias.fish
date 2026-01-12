
# refresh gpg-agent
alias rgpg "gpg-connect-agent updatestartuptty /bye"

# force gpg-agent to scan the card and recreate the key stubs
# use this whenever you're inserting a different key with the same set of gpg-keys
alias rgpg-stubs "gpg-connect-agent \"scd serialno\" \"learn --force\" /bye"

# SSH with the kitty terminfo files
alias kssh "kitten ssh"

# Reload kitty config
alias kitty-reload "kitty @ load-config"
