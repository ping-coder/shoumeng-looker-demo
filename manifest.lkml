project_name: "demo"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

remote_dependency: ga_block {
  url: "https://github.com/llooker/gaming_analytics_block.git"
  ref: "master"
}

################# Constants ################

constant: events_table {
  value: "`looker-demo-gaming.gaming.gaming_events_202302`"
  export: override_required
}
