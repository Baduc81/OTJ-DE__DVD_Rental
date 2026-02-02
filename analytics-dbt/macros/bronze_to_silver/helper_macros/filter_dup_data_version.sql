
-- This macro detects duplicated data versions by comparing record_hash
-- between incoming source data and the existing target table.
--
-- Behavior by SCD type:
-- - SCD Type 2: compare ONLY with the current active record (is_current = TRUE)
-- - SCD Type 1: compare with the latest record regardless of history

{% macro filter_dup_data_version(source, join_table, unique_key, standard_cols, scd_type = 'type2') %}
SELECT 
    cs.{{ unique_key }},
    {% for col in standard_cols -%}
    cs.{{ col }},
    {% endfor -%}
    cs.record_hash,
    cs.is_duplicated_file,
    -- Flag to identify duplicated record versions
    -- TRUE  -> incoming record is identical to existing record
    -- FALSE -> incoming record is different and should be processed
    CASE 
        WHEN cs.record_hash = t.record_hash THEN TRUE 
        ELSE FALSE 
    END AS is_duplicated_version
FROM {{ source }} cs
LEFT JOIN {{ join_table }} t
    ON cs.{{ unique_key }} = t.{{ unique_key }} 
    -- For SCD Type 2, only compare against the current active version
    {% if scd_type == 'type2' %}
        AND t.is_current = TRUE
    {% endif%}
{% endmacro %}