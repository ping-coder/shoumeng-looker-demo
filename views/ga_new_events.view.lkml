include: "//ga_block/gaming_block/events.view.lkml"

view: +events {
  sql_table_name: @{events_table} ;;
}
