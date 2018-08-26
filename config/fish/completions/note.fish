set -l list_tags "(ls ~/.notes)"

complete -c note -f -n "__fish_use_subcommand" -a "all-time edit find last-week new this-week"
complete -c note -f -n "__fish_seen_subcommand_from all-time" -a $list_tags
complete -c note -f -n "__fish_seen_subcommand_from edit" -a $list_tags
complete -c note -f -n "__fish_seen_subcommand_from find" -a $list_tags
complete -c note -f -n "__fish_seen_subcommand_from last-week" -a $list_tags
complete -c note -f -n "__fish_seen_subcommand_from new" -a $list_tags
complete -c note -f -n "__fish_seen_subcommand_from this-week" -a $list_tags
