# Based on https://github.com/shidil/awsctx/blob/main/fish/awsctx.fish
set -l profiles $(aws configure list-profiles)
complete -c awsctx -f -a "$profiles"
