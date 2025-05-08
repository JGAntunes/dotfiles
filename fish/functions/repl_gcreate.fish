# Utility functions for managing GCP instances based on https://github.com/replicatedhq/oh-my-replicated

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
