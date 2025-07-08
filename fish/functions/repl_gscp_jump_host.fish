
# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

function repl_gscp_jump_host --description 'SCP into a GCP instance using a predefined jump host first'
  repl_genv
  set -l usage "Usage: repl_gscp_jump_host [INSTANCE_NAME] [USER] [LOCAL_FILE] [REMOTE_FILE]"

  if test (count $argv) -lt 4
    echo $usage
    return 1
  end
  set -l jump_host "jump-host"
  set -q REPL_GJUMP_BOX; and set jump_host $REPL_GJUMP_BOX
  set -l instance_name (repl_gprefix $argv[1])
  set -l user "$argv[2]"
  set -l local_file "$argv[3]"
  set -l remote_file "$argv[4]"
  set jump_host (repl_gprefix $jump_host)


  set -l natip (gcloud compute instances describe "$jump_host" --format="value(networkInterfaces[0].accessConfigs[0].natIP)")
  set -l ip (gcloud compute instances describe "$instance_name" --format="value(networkInterfaces[0].networkIP)")

  scp -J $user@$natip $local_file $user@$ip:$remote_file 
end
