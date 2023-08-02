connection: "demo"

# include all the views
include: "/views/**/*.view.lkml"
include: "//ga_block/**/*.view"

# Model Configuration
datagroup: events_raw { sql_trigger:  SELECT current_date  ;; }
named_value_format: large_usd { value_format: "[>=1000000]\"$\"0.00,,\"M\";[>=1000]\"$\"0.00,\"K\";\"$\"0.00" }
named_value_format: large_number { value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0" }

datagroup: demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: demo_default_datagroup

explore:  gaming_events_202302{
  label: "Gaming Events"
}

# Explores
explore: events {
  label: "GA Events"
  # persist_with: events_raw

  always_filter: {
    filters: {
      field: event_date
      value: "last 7 days"
    }
  }

  join: sessions {
    sql_on: ${events.user_id} = ${sessions.user_id}
          AND ${events.event_raw} >= ${sessions.session_start_raw}
          AND ${events.event_raw} <= ${sessions.session_end_raw} ;;
    relationship: many_to_one
  }

  join: user_facts {
    view_label: "User Lifetime Values"
    relationship: many_to_one
    sql_on: ${events.user_id} = ${user_facts.user_id} ;;
  }
}
