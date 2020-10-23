function __fish_okta_complete_profiles
  cat ~/.aws/config | grep -e "\[[^(okta)]" | awk -F'[] []' '{print $3}'
end

function __fish_complete_okta_subcommand
  set -l tokens (commandline -opc) (commandline -ct)
  set -l index (contains -i -- -- (commandline -opc))
  set -e tokens[1..$index]
  complete -C"$tokens"
end

function __fish_okta_needs_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 ]
        return 0
    end
    return 1
end

function __fish_okta_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end
    return 1
end

set -l okta_commands add exec help login version
complete -f -c aws-okta -n "__fish_okta_needs_command" -a add -d 'add your okta credentials'
complete -f -c aws-okta -n "__fish_okta_needs_command" -a exec -d 'exec will run the command specified with aws credentials set in the environment'
complete -f -c aws-okta -n "__fish_okta_needs_command" -a help -d 'help about any command'
complete -f -c aws-okta -n "__fish_okta_needs_command" -a login -d 'login will authenticate you through okta and allow you to access your AWS environment through a browser'
complete -f -c aws-okta -n "__fish_okta_needs_command" -a version -d 'print version'
complete -f -c aws-okta -n "__fish_okta_using_command exec; and not __fish_seen_subcommand_from (__fish_okta_complete_profiles)" -a "(__fish_okta_complete_profiles)"
complete -f -c aws-okta -n "__fish_okta_using_command exec; and __fish_seen_subcommand_from (__fish_okta_complete_profiles); and not __fish_seen_subcommand_from --" -a "--"

complete -c aws-okta -n "__fish_okta_using_command exec; and __fish_seen_subcommand_from (__fish_okta_complete_profiles); and contains -- -- (commandline -opc)" -x -a "(__fish_complete_okta_subcommand)"

