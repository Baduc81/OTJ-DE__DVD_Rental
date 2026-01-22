{% macro add_total_occurrneces_col(source, standard_cols, unique_key) %}
SELECT
    cs.{{ unique_key }},
    {% for col in standard_cols -%}
    cs.{{ col }},
    {% endfor -%}
    ROW_NUMBER() OVER(
        PARTITION BY cs.{{ unique_key }}, cs.valid_from 
        ORDER BY cs.valid_from DESC
    ) as row_num,
    COUNT(*) OVER(
        PARTITION BY cs.{{ unique_key }}, cs.valid_from
    ) as total_occurrences
FROM
    {{ source }} cs
{% endmacro %}