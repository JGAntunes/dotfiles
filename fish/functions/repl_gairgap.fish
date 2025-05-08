# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

function repl_gairgap --description 'Make running GCP instances air-gapped'
  repl_genv
  set -l usage "Usage: repl_gairgap [INSTANCE_NAMES]"

  if test (count $argv) -lt 1
    echo $usage
    return 1
  end

  set -l instances $argv
  for instance in $instances
    set -l instance_name (repl_gprefix $instance)
    set -l access_config_name (gcloud compute instances describe "$instance_name" --format="value(networkInterfaces[0].accessConfigs[0].name)")
    set fish_trace 1; gcloud compute instances delete-access-config "$instance_name" --access-config-name="$access_config_name"; set fish_trace 0
  end
end
