set -l list_commands "(note commands)"
set -l list_tags "(note tags)"

complete -c note -f -n "__fish_use_subcommand" -a $list_commands
complete -c note -f -n "__fish_seen_subcommand_from commands" -a ""
complete -c note -f -n "__fish_seen_subcommand_from last" -a $list_tags
complete -c note -f -n "__fish_seen_subcommand_from new" -a $list_tags
complete -c note -f -n "__fish_seen_subcommand_from tags" -a ""
