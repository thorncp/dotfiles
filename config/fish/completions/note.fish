set -l list_tags "(note tags)"

complete -c note -f -n "__fish_use_subcommand" -a "new tags"
complete -c note -f -n "__fish_seen_subcommand_from new" -a $list_tags
complete -c note -f -n "__fish_seen_subcommand_from tags" -a ""
