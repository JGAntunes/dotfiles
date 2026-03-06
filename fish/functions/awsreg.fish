function awsreg -d "Select and change the current AWS region using fzf"
  set region $argv 
  if test -z "$argv"
    set region $(aws account list-regions \
         --query "Regions[?contains(RegionOptStatus, 'ENABLED')].RegionName" \
         --output json | jq -r '.[]' | fzf)
  end
  echo "Switching to AWS region $region"
  set -gx AWS_REGION $region
end

