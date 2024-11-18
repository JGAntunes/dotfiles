# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

function repl_genv --description 'Get config for gcloud'
  echo "Configuration: "(cat ~/.config/gcloud/active_config)
end

function repl_glist --description 'List GCP instances created by the user'
  repl_genv
  gcloud compute instances list --filter="labels.owner:$REPL_GUSER"
end

function repl_gcreate --description 'Create a GCP instance'
  repl_genv
  set -l usage 'Usage: repl_gcreate [-d duration|never] <IMAGE> <INSTANCE_NAMES>'
  # defaults to 1 day
  set -l expires (date "-v+1d" '+%Y-%m-%d')
  set -l options (fish_opt --short=d --long=duration)
  argparse $options -- $argv

  if test -n "$_flag_d"
    if test "$_flag_d" = "never"
      set expires "never"
    else
      set expires (date "-v+$_flag_d" '+%Y-%m-%d')
    end
  end

  if test (count $argv) -lt 2
    echo $usage
    return 1
  end
  set -l image_requested $argv[1]
  set -l instance_names $argv[2..-1]

  set -l machine_type ""
  if test -z "$GMACHINETYPE"
    set machine_type "n2-standard-2"
    echo "Using default GCP machine type 'n2-standard-2'"
  else
    set machine_type $GMACHINETYPE
    echo "Using specified GCP machine type '$GMACHINETYPE' (from \$GMACHINETYPE)"
  end

  set -l min_cpu_platform
  if test (string match -r "n1" $machine_type)
    echo "Adding '--min-cpu-platform=Intel Haswell' for nested virtualization"
    set min_cpu_platform --min-cpu-platform="Intel Haswell"
  end

  set -l image (gcloud compute images list | grep -v arm | grep "$image_requested" | awk 'NR == 1')
  if test -z "$image"
    set image (gcloud compute images list --show-deprecated --sort-by=~creationTimestamp | grep "$image_requested" | awk 'NR == 1')
  end
  if test -z $image
    echo "gcreate: unknown image $image_requested"
    echo $usage
    return 1
  end

  set -l image_name (echo "$image" | awk '{print $1}')
  set -l image_project (echo "$image" | awk '{print $2}')
  set -l default_service_account (gcloud iam service-accounts list | grep -o '[0-9]*\-compute@developer.gserviceaccount.com')

  if test -n "$REPL_GPREFIX"
    set instance_names (echo $instance_names | sed "s/[^ ]* */$REPL_GPREFIX-&/g")
  end
  echo "Done"
  set fish_trace 1; gcloud compute instances create $instance_names \
    --labels owner="$REPL_GUSER",email=$REPL_GUSER"__64__replicated__46__com",expires-on="$expires" \
    --machine-type="$machine_type" \
    --enable-nested-virtualization \
    $min_cpu_platform \
    --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --can-ip-forward \
    --service-account="$default_service_account" \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --image="$image_name" --image-project="$image_project" \
    --boot-disk-size=200GB --boot-disk-type=pd-ssd \
    --create-disk size=100GB,type=pd-ssd,auto-delete=yes \
    --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any; set fish_trace 0
end

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

function repl_gcreate_jump_host --description 'Utility method to create a jump box'
  repl_gcreate "ubuntu-2004-lts" $REPL_GJUMP_BOX
end

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

function repl_gprefix
    if test -n "$REPL_GPREFIX"
      echo "$GPREFIX-$argv[1]"
    else
      echo "$argv[1]"
    end
end
