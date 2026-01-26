{% macro log_check_rejected(select_sql) %}
  {# Build EXISTS SQL #}
  {% set exists_sql %}
    SELECT EXISTS(
      SELECT 1
      FROM ( {{ select_sql }} ) AS sub
      LIMIT 1
    ) AS has_rows
  {% endset %}

  {# Execute and extract boolean #}
  {% set res = run_query(exists_sql) %}

  {% do return(res) %}
{% endmacro %}