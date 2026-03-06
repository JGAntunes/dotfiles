set -l regions $(aws account list-regions \
         --query "Regions[?contains(RegionOptStatus, 'ENABLED')].RegionName" \
         --output json | jq -r '.[]')
complete -c awsreg -f -a "$regions"
