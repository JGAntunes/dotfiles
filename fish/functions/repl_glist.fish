# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

function repl_glist --description 'List GCP instances created by the user'
  repl_genv
  gcloud compute instances list --filter="labels.owner:$REPL_GUSER"
end
