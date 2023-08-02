connection: "demo"

# include all the views
include: "/views/**/*.view.lkml"
include: "//ga_block/**/*.view"

datagroup: demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: demo_default_datagroup

explore:  gaming_events_202302{
  label: "Gaming Events"
}
