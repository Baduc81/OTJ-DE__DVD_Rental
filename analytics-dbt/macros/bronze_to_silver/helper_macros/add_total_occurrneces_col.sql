{% macro add_total_occurrneces_col(source, standard_cols, unique_key) %}

--- purpose: to count the occurrence of rows for future deduplication in files
--- source: a table
--- standard_cols: the common columns in source
--- unique_key: the unique_col 

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