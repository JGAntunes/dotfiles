# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

function repl_gdelete_all --description 'Delete all GCP instance created by the user'
  repl_genv
  set -l usage "Usage: repl_gdelete_all"

  if test (count $argv) -gt 0
    echo $usage
    return 1
  end

  set -l instances (gcloud compute instances list --filter="labels.owner:$REPL_GUSER" | grep RUNNING | awk '{print $1}' | xargs echo)
  set fish_trace 1; gcloud compute instances delete --delete-disks=all $instances --quiet; set fish_trace 0
end
