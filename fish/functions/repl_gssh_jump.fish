# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

function repl_gssh_jump --description 'SSH into a GCP instance using a predefined jump host first'
  repl_genv
  set -l usage "Usage: repl_gssh_jump [INSTANCE_NAME] [USER]"

  if test (count $argv) -lt 2
    echo $usage
    return 1
  end
  set -l jump_host "jump-host"
  set -q REPL_GJUMP_BOX; and set jump_host $REPL_GJUMP_BOX
  set -l instance_name (repl_gprefix $argv[1])
  set -l user "$argv[2]"
  set jump_host (repl_gprefix $jump_host)


  set -l natip (gcloud compute instances describe "$jump_host" --format="value(networkInterfaces[0].accessConfigs[0].natIP)")
  set -l ip (gcloud compute instances describe "$instance_name" --format="value(networkInterfaces[0].networkIP)")

  ssh -J $user@$natip $user@$ip
end
