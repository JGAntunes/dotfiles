# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

function repl_gdelete --description 'Delete a GCP instance'
  repl_genv
  set -l usage "Usage: repl_gdelete [INSTANCE_NAMES]"

  if test (count $argv) -lt 1
    echo $usage
    return 1
  end

  set -l instances $argv
  for instance in $instances
    set -l instance_name (repl_gprefix $instance)
    set fish_trace 1; gcloud compute instances delete --delete-disks=all "$instance_name" --quiet; set fish_trace 0
  end
end
