{{- config(
    materialized='incremental',
    incremental_strategy='append'
) -}}

SELECT 
    category_id,
    category_name,
    file_name,
    valid_from
FROM {{ ref("category_tmp") }}
WHERE is_duplicated_version = TRUE
    OR is_duplicated_version = TRUE