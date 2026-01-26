{% macro filter_dup_data_within_file(source) %}
SELECT 
    *,
    CASE 
        WHEN total_occurrences > 1 THEN TRUE 
        ELSE FALSE 
    END AS is_duplicated_file
FROM {{ source}}
WHERE row_num = 1
{% endmacro %}