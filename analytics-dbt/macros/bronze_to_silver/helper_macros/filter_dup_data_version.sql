{%- macro filter_dup_data_version(source, join_table, unique_key, standard_cols) -%}
SELECT 
    cs.{{ unique_key }},
    {% for col in standard_cols -%}
    cs.{{ col }},
    {% endfor -%}
    cs.record_hash,
    cs.is_duplicated_file,
    CASE 
        WHEN cs.record_hash = t.record_hash THEN TRUE 
        ELSE FALSE 
    END AS is_duplicated_version
FROM {{ source }} cs
LEFT JOIN {{ join_table }} t
    ON cs.{{ unique_key }} = t.{{ unique_key }} AND t.is_current = TRUE
{%- endmacro -%}