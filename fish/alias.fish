
# refresh gpg-agent
alias rgpg "gpg-connect-agent updatestartuptty /bye"

# force gpg-agent to scan the card and recreate the key stubs
# use this whenever you're inserting a different key with the same set of gpg-keys
alias rgpg-stubs "gpg-connect-agent \"scd serialno\" \"learn --force\" /bye"

# Replicated Specific alias
alias sbc "sbctl shell --support-bundle-location $1"
