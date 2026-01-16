# Based on https://github.com/shidil/awsctx/blob/main/fish/awsctx.fish
function awsctx -d "Select and change the current AWS profile using fzf and SSO login if unauthenticated"
  set profile $argv 
  if test -z "$argv"
    set profile $(aws configure list-profiles | fzf)
  end
  echo "Switching to AWS profile $profile"
  set -gx AWS_PROFILE $profile
  aws sts get-caller-identity || aws sso login
end

