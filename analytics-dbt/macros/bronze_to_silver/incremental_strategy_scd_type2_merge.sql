{% macro get_incremental_scd_type2_merge_sql(arg_dict) %}
    {{ log("Merge data from " ~ arg_dict['temp_relation'] ~ ", " ~ arg_dict['target_relation'], info=True) }}
    {% do return(scd_type2_merge(arg_dict['target_relation'], config.get('standard_cols'), arg_dict['unique_key'], arg_dict['temp_relation'])) %}
{% endmacro %}

{% macro scd_type2_merge(target_relation, standard_cols, unique_key, temp_relation) %}
MERGE INTO {{ target_relation }} t
USING (  
    WITH ranking_view AS (
        SELECT *,
            ROW_NUMBER() OVER (PARTITION BY {{ unique_key }} ORDER BY valid_from ASC) AS ranking
        FROM {{ temp_relation }}
        WHERE is_duplicated_version = FALSE)
    SELECT *,
        LEAD(valid_from) OVER (PARTITION BY {{ unique_key }} ORDER BY valid_from ASC) AS valid_to_lead,
        {{ unique_key }} AS join_key
    FROM ranking_view
    UNION ALL
    SELECT *,
        LEAD(valid_from) OVER (PARTITION BY {{ unique_key }} ORDER BY valid_from ASC) AS valid_to_lead,
        NULL AS join_key
    FROM ranking_view
) s ON t.{{ unique_key }} = s.join_key
    AND t.is_current = TRUE
WHEN MATCHED AND (s.ranking = 1) THEN
    UPDATE SET
        t.is_current = FALSE,
        t.valid_to = s.valid_from
WHEN NOT MATCHED AND (s.join_key IS NULL) THEN
    INSERT (
        {{ unique_key }},
        {% for col in standard_cols %}{{ col }}, {% endfor %}
        valid_to, is_current, is_delete
    )
    VALUES (
        s.{{ unique_key }},
        {% for col in standard_cols %}s.{{ col }}, {% endfor %}
        s.valid_to_lead,
        (CASE WHEN s.valid_to_lead IS NULL THEN TRUE ELSE FALSE END),
        FALSE
    )
{% endmacro %}
