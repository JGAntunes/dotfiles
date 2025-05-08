# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

function repl_gprefix
    if test -n "$REPL_GPREFIX"
      echo "$REPL_GPREFIX-$argv[1]"
    else
      echo "$argv[1]"
    end
end
